import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/login_model.dart';

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
