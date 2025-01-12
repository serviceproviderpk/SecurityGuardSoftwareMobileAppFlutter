import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/Resources/ap_url.dart';

import '../models/inbox_model.dart';
import 'class/local_class.dart';

class InboxApiService {
  final Dio _dio = Dio();

  Future<List<InboxMessagesModel>> fetchMessages() async {
    try {
      final int guardId = await LocalStorage.getGuardId();

      if (guardId == 0) {
        throw Exception('Guard ID not found or is invalid.');
      }

      final String url = "${Endpoint.inboxMessages}?GuardId=$guardId";

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
