import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/services/class/local_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Resources/ap_url.dart';
import '../models/post_model.dart';

class LeaveRequestApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<PostResponse> applyLeave(
    String reason,
    DateTime fromDate,
    DateTime toDate,
    int leaveType,
    int workingDays,
  ) async {
    try {
      final int profileId = await LocalStorage.getLoginUserId();
      final int guardId = await LocalStorage.getGuardId();

      final prefs = await SharedPreferences.getInstance();
      final int scheduleId = prefs.getInt('ScheduleDetailId') ?? 0;
      print('scheduleId $scheduleId');

      final response = await _dio.post(
        'https://sss.futureminutes.com/api/ApplyLeave/LeaveRequest',
        data: {
          "ScheduleDetailId": scheduleId,
          "UsersProfile_ID": profileId,
          "Guards_ID": guardId,
          "ReasonOfLeave": reason,
          "FromDate": fromDate.toIso8601String(),
          "ToDate": toDate.toIso8601String(),
          "leave_type_id": leaveType,
          "WorkingDays": workingDays,
        },
      );

      if (response.statusCode == 200) {
        return PostResponse.fromJson(response.data);
      } else {
        throw Exception(
            "Failed to post leave request. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Dio error: $e');
      return PostResponse(
        isSuccess: false,
        message: "Error: $e",
        content: null,
      );
    }
  }
}
