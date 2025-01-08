import 'package:dio/dio.dart';
import 'package:securitymanagementsystem/resources/ap_url.dart';

import '../models/notifications_model.dart';

class NotificationsApiServices {
  final Dio _dio = Dio();

  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final response = await _dio.get(Endpoint.myNotification);

      if (response.statusCode == 200) {
        var data = response.data;
        return (data['Content'] as List)
            .map((item) => NotificationModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      throw Exception('Error fetching notifications: $e');
    }
  }
}
