import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/post_model.dart';
import 'package:securitymanagementsystem/services/class/local_class.dart';

class MyPetrolApiService {
  final Dio _dio = Dio(BaseOptions(
    headers: {
      "Content-Type": "application/json",
    },
  ));

  Future<PostResponse> myPetrol() async {
    try {
      final int organizationId = await LocalStorage.getOrganizationId();
      final int guardId = await LocalStorage.getGuardId();
      final int branchId = await LocalStorage.getBranchId();

      final String url =
          "${Endpoint.myPetrol}?GuardId=$guardId&OrganizationId=$organizationId&BranchId=$branchId";
      final response = await _dio.post(url);

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
