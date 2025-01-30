import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';
import 'package:securitymanagementsystem/models/my_schedule_model.dart';
import 'package:securitymanagementsystem/services/class/local_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySchedulesApiService {
  final Dio _dio = Dio();

  Future<List<MyScheduleModel>> fetchMySchedule() async {
    try {
      final int guardId = await LocalStorage.getGuardId();
      if (guardId == 0) {
        throw Exception('Guard ID not found or is invalid.');
      }

      final String url = "${Endpoint.mySchedule}?GuardId=$guardId";
      final response = await _dio.get(url);

      if (response.data['IsSuccess'] == true) {
        final List<dynamic> content = response.data['Content'] ?? [];
        final List<MyScheduleModel> schedules =
            content.map((json) => MyScheduleModel.fromJson(json)).toList();

        final prefs = await SharedPreferences.getInstance();
        if (schedules.isNotEmpty) {
          await prefs.setInt('ScheduleDetailId', schedules[0].scheduleId);
        }

        return schedules;
      } else {
        throw Exception('Unsuccessful request.');
      }
    } catch (e) {
      throw Exception('Error fetching schedules: $e');
    }
  }
}
