import 'package:flutter/material.dart';

import '../services/send_notification_api_service.dart';

class PostNotificationViewModel extends ChangeNotifier {
  final PostNotificationApiService _apiService = PostNotificationApiService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _message = '';

  String get message => _message;

  Future<void> sendNotification(
      int orgId, int branchId, int userId, String alertMessage) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.postNotification(
          orgId, branchId, userId, alertMessage);
      _message = response.message;
    } catch (e) {
      _message = "Failed to send notification: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
