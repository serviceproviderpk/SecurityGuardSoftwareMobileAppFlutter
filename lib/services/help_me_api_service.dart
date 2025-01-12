import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/help_me_model.dart'; // Import your HelpMeModel
import 'package:shared_preferences/shared_preferences.dart';

class HelpMeApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Endpoint.baseUrl,
    headers: {"Content-Type": "application/json"},
  ));

  Future<HelpMeModel> askHelp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int organizationId = prefs.getInt('Organization_ID') ?? 0;
      final int branchId = prefs.getInt('Branch_ID') ?? 0;
      final int usersProfileId = prefs.getInt('UsersProfile_ID') ?? 0;

      if (organizationId == 0 || branchId == 0 || usersProfileId == 0) {
        throw Exception("Error: Missing required data in SharedPreferences");
      }

      final response = await _dio.post(
        'https://sss.futureminutes.com/api/HelpMe/Sendnow',
        data: {
          "organizationId": organizationId,
          "branchId": branchId,
          "loginUserId": usersProfileId,
        },
      );

      if (response.statusCode == 200) {
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
