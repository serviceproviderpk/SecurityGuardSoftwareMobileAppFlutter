import 'package:dio/dio.dart';

import '../Resources/ap_url.dart';
import '../models/attendance_model.dart';

class AttendanceApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<List<Attendance>> fetchAttendanceData() async {
    try {
      final response = await _dio.get(
        Endpoint.attendanceDetails,
        queryParameters: {
          "OrganizationId": 185,
          "BranchId": 186,
          "UsersProfileId": 187,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['IsSuccess'] == true && data['Content'] != null) {
          return (data['Content'] as List)
              .map((item) => Attendance.fromJson(item))
              .toList();
        } else {
          throw Exception(data['Message'] ?? 'No data available.');
        }
      } else {
        throw Exception(
            'Failed to fetch data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
