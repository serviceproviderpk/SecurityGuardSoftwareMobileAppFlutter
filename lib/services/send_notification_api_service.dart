import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/post_model.dart';
import 'package:securitymanagementsystem/services/class/local_class.dart';

class PostNotificationApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<PostResponse> postNotification(
      int orgId, int branchId, int userId, String message) async {
    try {
      final int orgId = await LocalStorage.getOrganizationId();
      final int branchId = await LocalStorage.getBranchId();
      final int logInUser = await LocalStorage.getLoginUserId();

      final String url = Endpoint.postNotification;
      final response = await _dio.post(
        url,
        data: {
          "organizationId": orgId,
          "branchId": branchId,
          "loginUserId": logInUser,
          "alertMessage": message,
        },
      );

      if (response.statusCode == 200) {
        return PostResponse.fromJson(response.data);
      } else {
        throw Exception(
            "Failed to post notification. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
