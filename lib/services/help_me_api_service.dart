import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/help_me_model.dart'; // Import your HelpMeModel

class HelpMeApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<HelpMeModel> askHelp(int orgId, int branchId, int userId) async {
    try {
      final response = await _dio.post(
        'https://sss.futureminutes.com/api/HelpMe/Sendnow',
        data: {
          "organizationId": orgId,
          "branchId": branchId,
          "loginUserId": userId,
        },
      );

      if (response.statusCode == 200) {
        // Create HelpMeModel from the response
        return HelpMeModel.fromJson(response.data);
      } else {
        throw Exception(
            "Failed for asking Help. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
