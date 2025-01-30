import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/my_leaves_model.dart';

import 'class/local_class.dart';

class MyLeavesApiServices {
  final Dio _dio = Dio();

  Future<List<MyLeavesModel>> fetchLeaveData() async {
    try {
      final int userId = await LocalStorage.getLoginUserId();
      final int organizationId = await LocalStorage.getOrganizationId();
      final int branchId = await LocalStorage.getBranchId();

      if (userId == 0 && organizationId == 0 && branchId == 0) {
        throw Exception('User not found or is invalid.');
      }

      final String url =
          "${Endpoint.myLeaves}?OrganizationID=$organizationId&BranchID=$branchId&loginUserId=$userId";

      final response = await _dio.get(url);

      if (response.data['IsSuccess'] == true) {
        final List<dynamic> content = response.data['Content'] ?? [];
        return content.map((json) => MyLeavesModel.fromJson(json)).toList();
      } else {
        throw Exception('No data found or unsuccessful request.');
      }
    } catch (e) {
      throw Exception('Error fetching messages: $e');
    }
  }
}
