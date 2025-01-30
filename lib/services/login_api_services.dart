import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        final postResponse = PostResponse.fromJson(response.data);

        if (postResponse.isSuccess) {
          final content = postResponse.content;

          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('Organization_ID', content['Organization_ID']);
          await prefs.setInt('Branch_ID', content['Branch_ID']);
          await prefs.setInt('UsersProfile_ID', content['UsersProfile_ID']);
          await prefs.setInt('Guards_ID', content['Guards_ID']);
          return postResponse;
        } else {
          throw Exception('Login failed: ${postResponse.message}');
        }
      } else {
        throw Exception(
            "Failed to log in. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
