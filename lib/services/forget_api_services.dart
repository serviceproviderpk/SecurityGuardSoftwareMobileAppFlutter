import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';

import '../models/password_reset_response.dart';

class ResetApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<PasswordResetResponse> resetPassword(String email) async {
    try {
      final response = await _dio.post(
        "Forget/PasswordReset",
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
