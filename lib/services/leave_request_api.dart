import 'package:dio/dio.dart';

import '../Resources/ap_url.dart';
import '../models/post_model.dart';

class LeaveRequestApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ))
    ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

  Future<PostResponse> postNotification(
    int scheduleId,
    int profileId,
    int guardId,
    String reason,
    DateTime fromDate,
    DateTime toDate,
    int leaveType,
    int workingDays,
  ) async {
    try {
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
            "Failed to post notification. Status code: ${response.statusCode}");
      }
    } catch (e) {
      ('Dio error: $e');
      throw Exception("Error: $e");
    }
  }
}
