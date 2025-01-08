import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/post_model.dart';

class MyPetrolApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<PostResponse> validateUser(
      int guardId, int orgId, int branchId) async {
    try {
      final response = await _dio.post(
        'https://sss.futureminutes.com/api/Patrols/SystemPatrolsV2?GuardId=85&OrganizationId=146&BranchId=154',
        data: {
          "GuardId": guardId,
          "OrganizationId": orgId,
          "BranchId": branchId
        },
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
