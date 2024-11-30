import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/services/api_service.dart';

import '../models/notifications_model.dart';

class NotificationViewModel with ChangeNotifier {
  final ApiService _apiService;
  List<NotificationModel> _notifications = [];

  bool _isLoading = true;

  NotificationViewModel({required ApiService apiService})
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
