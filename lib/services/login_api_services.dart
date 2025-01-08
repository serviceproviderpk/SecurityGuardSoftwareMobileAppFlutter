import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/post_model.dart';

class LogInApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<PostResponse> validateUser(String email, String password) async {
    try {
      final response = await _dio.post(
        Endpoint.logIn,
        data: {"Email": email, "Password": password},
      );

      if (response.statusCode == 200) {
        return PostResponse.fromJson(response.data);
      } else {
        throw Exception(
            "Failed to log in. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
