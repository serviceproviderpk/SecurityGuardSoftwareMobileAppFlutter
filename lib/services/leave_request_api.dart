import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/services/class/local_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Resources/ap_url.dart';
import '../models/post_model.dart';

class LeaveRequestApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ))
    ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

  Future<PostResponse> postNotification(
    String reason,
    DateTime fromDate,
    DateTime toDate,
    int leaveType,
    int workingDays,
  ) async {
    try {
      final int scheduleId = await LocalStorage.scheduleId();
      final int profileId = await LocalStorage.getLoginUserId();
      final int guardId = await LocalStorage.getGuardId();
      print('guard: $guardId');

      final response = await _dio.post(
        'https://sss.futureminutes.com/api/ApplyLeave/LeaveRequest',
        data: {
          "ScheduleDetailId": scheduleId,
          "UserId": profileId,
          "GuardId": guardId,
          "ReasonOfLeave": reason,
          "FromDate": fromDate.toIso8601String(),
          "ToDate": toDate.toIso8601String(),
          "leave_type_id": leaveType,
          "WorkingDays": workingDays,
        },
      );

      if (response.statusCode == 200) {
        final postResponse = PostResponse.fromJson(response.data);
        if (postResponse.isSuccess) {
          final content = postResponse.content;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt("ScheduleDetailId", content['ScheduleDetailId']);
        }
        return postResponse; // Ensure returning the response
      } else {
        throw Exception(
            "Failed to post notification. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Dio error: $e');
      return PostResponse(
        isSuccess: false,
        message: "Error: $e",
        content: null,
      ); // Return a default/failure PostResponse on error
    }
  }
}
