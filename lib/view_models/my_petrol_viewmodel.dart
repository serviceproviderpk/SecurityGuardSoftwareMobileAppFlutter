import 'package:flutter/material.dart';

import '../services/my_petrol_api_service.dart';

class MyPetrolViewModel extends ChangeNotifier {
  final MyPetrolApiService _apiService = MyPetrolApiService();
  bool isLoading = false;
  String message = '';

  Future<void> myPetrol() async {
    isLoading = true;
    message = '';
    notifyListeners();

    try {
      final response = await _apiService.myPetrol();
      if (response.isSuccess) {
        message = response.message;
      } else {
        message = response.message ??
            'Unexpected error occurred.';
      }
    } catch (e) {
      message = "Error: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
