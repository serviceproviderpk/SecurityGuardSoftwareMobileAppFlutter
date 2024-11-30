import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/services/api_service.dart';

class PasswordResetViewModel extends ChangeNotifier {
  final ResetApiService _resetApiService = ResetApiService();

  String email = '';
  bool isLoading = false;
  String message = '';

  Future<void> resetPassword() async {
    if (email.isEmpty) {
      message = "Please enter your email address.";
      notifyListeners();
      return;
    } else if (!email.contains('@') || !email.contains('.')) {
      message = "Please enter the correct email address";
      notifyListeners();
      return;
    }

    isLoading = true;
    message = '';
    notifyListeners();

    try {
      final response = await _resetApiService.resetPassword(email);
      message = response.message;
    } catch (e) {
      message = "Error: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
