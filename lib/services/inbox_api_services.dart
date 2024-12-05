import 'package:dio/dio.dart';

import '../models/inbox_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Message>> fetchMessages(int guardId) async {
    final url =
        'https://sss.futureminutes.com/api/SystemMessages/MyMessages?GuardId=$guardId';

    try {
      final response = await _dio.get(url);

      if (response.data['IsSuccess'] == true) {
        final List<dynamic> content = response.data['Content'] ?? [];
        return content.map((json) => Message.fromJson(json)).toList();
      } else {
        throw Exception('No data found or unsuccessful request.');
      }
    } catch (e) {
      throw Exception('Error fetching messages: $e');
    }
  }
}
