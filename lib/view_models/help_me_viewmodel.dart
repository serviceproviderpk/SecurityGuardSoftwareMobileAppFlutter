import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/services/help_me_api_service.dart';

class HelpMeViewmodel extends ChangeNotifier {
  final HelpMeApiService _apiService = HelpMeApiService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _message = '';

  String get message => _message;

  Future<void> helpRequest(int orgId, int branchId, int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Get HelpMeModel data from API service
      final response = await _apiService.askHelp(orgId, branchId, userId);

      // Update message based on the response
      _message = response.message;
    } catch (e) {
      _message = "Failed to send Help Request: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
