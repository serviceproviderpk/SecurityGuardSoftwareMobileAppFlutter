import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/models/my_leaves_model.dart';
import 'package:securitymanagementsystem/resources/ap_url.dart';
import 'package:securitymanagementsystem/services/class/local_class.dart';

class MyLeavesApiServices {
  final Dio _dio = Dio();

  Future<List<MyLeavesModel>> fetchLeaveData() async {
    try {
      final int OrganizationId = await LocalStorage.getOrganizationId();
      final int BranchId = await LocalStorage.getGuardId();
      final int LogInUserId = await LocalStorage.getLoginUserId();

      final String url =
          "${Endpoint.myLeaves}?OrganizationID=$OrganizationId&BranchID=$BranchId&loginUserId=$LogInUserId";
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        if (response.data['IsSuccess'] == true) {
          final List<dynamic> content = response.data['Content'] ?? [];
          return content.map((json) => MyLeavesModel.fromJson(json)).toList();
        } else {
          throw Exception(response.data['Message'] ?? 'No data found.');
        }
      } else {
        throw Exception('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
