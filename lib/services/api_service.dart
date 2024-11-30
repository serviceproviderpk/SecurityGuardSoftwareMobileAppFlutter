import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/login_model.dart';

import '../models/attendance_model.dart';
import '../models/notifications_model.dart';
import '../models/password_reset_response.dart';

class LogInApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<LogInResponse> validateUser(String email, String password) async {
    try {
      final response = await _dio.post(
        Endpoint.logIn,
        data: {"Email": email, "Password": password},
      );

      if (response.statusCode == 200) {
        return LogInResponse.fromJson(response.data);
      } else {
        throw Exception(
            "Failed to log in. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}

//----------------------------------@------------------------------------//

// CheckInOut API

class CheckInOutApiService {
  final String baseUrl = Endpoint.checkInOut;

  Future<Map<String, dynamic>> checkInOut({
    required int organizationId,
    required int branchId,
    required int loginUserId,
    required String checkInOutType,
  }) async {
    final Uri url = Uri.parse(
        "$baseUrl?OrganizationId=$organizationId&BranchId=$branchId&LoginUserId=$loginUserId");

    final Map<String, dynamic> body = {
      "checkInOutType": checkInOutType,
      "timestamp": DateTime.now().toIso8601String(),
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            "Failed to send data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}

//----------------------------------@------------------------------------//

// Forget/Reset password

class ResetApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://sss.futureminutes.com/api/Forget",
    headers: {"Content-Type": "application/json"},
  ));

  Future<PasswordResetResponse> resetPassword(String email) async {
    try {
      final response = await _dio.post(
        "/PasswordReset",
        data: {"Email": email},
      );

      if (response.statusCode == 200) {
        return PasswordResetResponse.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to reset password. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

//----------------------------------@------------------------------------//

// Attendance details API

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

class ApiService {
  final Dio _dio = Dio();

  Future<List<NotificationModel>> fetchNotifications(int guardId) async {
    try {
      final response = await _dio.get(
        "https://sss.futureminutes.com/api/MyNotifictions/SystemNotifications",
        queryParameters: {"GuardId": guardId},
      );

      if (response.statusCode == 200) {
        var data = response.data;
        return (data['Content'] as List)
            .map((item) => NotificationModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      throw Exception('Error fetching notifications: $e');
    }
  }
}
