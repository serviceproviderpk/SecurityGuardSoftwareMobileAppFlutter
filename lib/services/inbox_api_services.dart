import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';

import '../models/inbox_model.dart';

class InboxApiService {
  final Dio _dio = Dio();

  Future<List<InboxMessagesModel>> fetchMessages() async {
    final url = Endpoint.inboxMessages;
    try {
      final response = await _dio.get(url);

      if (response.data['IsSuccess'] == true) {
        final List<dynamic> content = response.data['Content'] ?? [];
        return content
            .map((json) => InboxMessagesModel.fromJson(json))
            .toList();
      } else {
        throw Exception('No data found or unsuccessful request.');
      }
    } catch (e) {
      throw Exception('Error fetching messages: $e');
    }
  }
}
