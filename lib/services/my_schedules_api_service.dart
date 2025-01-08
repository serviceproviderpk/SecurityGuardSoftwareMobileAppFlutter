import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/models/my_schedule_model.dart';
import 'package:securitymanagementsystem/resources/ap_url.dart';

class MyScheduleApiService {
  final Dio _dio = Dio();

  Future<List<MyScheduleModel>> fetchMessages() async {
    final url = Endpoint.mySchedule;
    try {
      final response = await _dio.get(url);

      if (response.data['IsSuccess'] == true) {
        final List<dynamic> content = response.data['Content'] ?? [];
        return content.map((json) => MyScheduleModel.fromJson(json)).toList();
      } else {
        throw Exception('No data found or unsuccessful request.');
      }
    } catch (e) {
      throw Exception('Error fetching messages: $e');
    }
  }
}
