import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/models/login_model.dart';

import '../services/api_service.dart';

class LoginViewModel extends ChangeNotifier {
  final LogInApiService _apiService = LogInApiService();
  bool isLoading = false;
  String message = '';

  Future<LogInResponse?> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      message = "Please fill in all fields.";
      notifyListeners();
      return null;
    }

    isLoading = true;
    message = '';
    notifyListeners();

    try {
      final response = await _apiService.validateUser(email, password);
      if (response.isSuccess) {
        return response;
      } else {
        message = response.message;
        notifyListeners();
      }
    } catch (e) {
      message = "Error: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return null;
  }
}
