import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/services/help_me_api_service.dart';

class HelpMeViewmodel extends ChangeNotifier {
  final HelpMeApiService _apiService = HelpMeApiService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _message = '';

  String get message => _message;

  Future<void> helpRequest() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.askHelp();

      _message = response.message;
    } catch (e) {
      _message = "Failed to send Help Request: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
