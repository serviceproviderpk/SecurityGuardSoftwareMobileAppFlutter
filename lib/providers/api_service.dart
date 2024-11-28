import 'dart:convert';

import 'package:http/http.dart' as http;

class CheckInOutApiService {
  final String baseUrl =
      "https://sss.futureminutes.com/api/CheckInOut/SystemCheckInOut";

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

// forget password api

class ApiService {
  final String baseUrl =
      "https://sss.futureminutes.com/api/Forget/PasswordReset";

  Future<Map<String, dynamic>> passwordReset({
    required String email,
  }) async {
    final Map<String, dynamic> body = {
      "Email": email,
    };

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception(
            'Failed to reset password. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
