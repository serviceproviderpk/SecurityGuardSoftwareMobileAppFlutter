import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/models/my_schedule_model.dart';
import 'package:securitymanagementsystem/resources/ap_url.dart';
import 'package:securitymanagementsystem/services/class/local_class.dart';

class MySchedulesApiService {
  final Dio _dio = Dio();

  Future<List<MyScheduleModel>> fetchMySchedule() async {
    try {
      final int guardId = await LocalStorage.getGuardId();
      print('guard; $guardId');
      if (guardId == 0) {
        throw Exception("Invalid Guard ID");
      }

      final String url = "${Endpoint.mySchedule}?GuardId=$guardId";
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        if (response.data['IsSuccess'] == true) {
          final List<dynamic>? content = response.data['Content'];
          if (content == null || content.isEmpty) {
            throw Exception('No schedules found.');
          }

          return content.map((json) => MyScheduleModel.fromJson(json)).toList();
        } else {
          throw Exception(response.data['Message'] ?? 'No data found.');
        }
      } else {
        throw Exception('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
