import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Resources/ap_url.dart';
import '../models/attendance_model.dart';

class AttendanceApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<List<Attendance>> fetchAttendanceData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int organizationId = prefs.getInt('Organization_ID') ?? 0;
      final int branchId = prefs.getInt('Branch_ID') ?? 0;
      final int usersProfileId = prefs.getInt('UsersProfile_ID') ?? 0;

      if (organizationId == 0 || branchId == 0 || usersProfileId == 0) {
        throw Exception("Error: Missing required data in SharedPreferences");
      }

      final response = await _dio.get(
        Endpoint.attendanceDetails,
        queryParameters: {
          "OrganizationId": organizationId,
          "BranchId": branchId,
          "UsersProfileId": usersProfileId,
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
