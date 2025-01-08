import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/models/my_leaves_model.dart';
import 'package:securitymanagementsystem/resources/ap_url.dart';

class MyLeavesApiServices {
  final Dio _dio = Dio();

  Future<List<MyLeavesModel>> fetchLeaveData() async {
    final url = Endpoint.myLeaves;
    try {
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
