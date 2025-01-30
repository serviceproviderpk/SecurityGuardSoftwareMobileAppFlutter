import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/services/class/local_class.dart';

import '../Resources/ap_url.dart';
import '../models/attendance_model.dart';

class AttendanceApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<List<Attendance>> fetchAttendanceData() async {
    try {
      final int organizationId = await LocalStorage.getOrganizationId();
      final int branchId = await LocalStorage.getBranchId();
      final int usersProfileId = await LocalStorage.getLoginUserId();

      if (organizationId == 0 || branchId == 0 || usersProfileId == 0) {
        throw Exception("Error: Missing required data in SharedPreferences");
      }

      final String url =
          "${Endpoint.attendanceDetails}?OrganizationId=$organizationId&BranchId=$branchId&UsersProfileId=$usersProfileId";
      final response = await _dio.get(url);

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
