import 'package:dio/dio.dart';

import '../models/notifications_model.dart';

class NotificationsApiServices {
  final Dio _dio = Dio();

  Future<List<NotificationModel>> fetchNotifications(int guardId) async {
    try {
      final response = await _dio.get(
        "https://sss.futureminutes.com/api/MyNotifictions/SystemNotifications",
        queryParameters: {"GuardId": guardId},
      );

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
