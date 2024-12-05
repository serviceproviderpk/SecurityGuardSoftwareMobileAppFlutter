import 'package:flutter/material.dart';

import '../models/notifications_model.dart';
import '../services/notification_api_services.dart';

class NotificationViewModel with ChangeNotifier {
  final NotificationsApiServices _apiService;
  List<NotificationModel> _notifications = [];

  bool _isLoading = true;

  NotificationViewModel({required NotificationsApiServices apiService})
      : _apiService = apiService;

  List<NotificationModel> get notifications => _notifications;

  bool get isLoading => _isLoading;

  Future<void> fetchNotifications(int guardId) async {
    try {
      _notifications = await _apiService.fetchNotifications(guardId);
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
