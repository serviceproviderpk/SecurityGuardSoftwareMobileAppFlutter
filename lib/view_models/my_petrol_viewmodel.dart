import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/services/my_petrol_api_service.dart';

class MyPetrolViewModel extends ChangeNotifier {
  final MyPetrolApiService _apiService = MyPetrolApiService();
  bool isLoading = false;
  String message = '';

  Future<void> myPetrol(int guardId, int orgId, int branchId) async {
    isLoading = true;
    message = '';
    notifyListeners();

    try {
      final response = await _apiService.validateUser(guardId, orgId, branchId);
      if (response != null && response.isSuccess) {
        message = response.message;
      } else {
        message = response?.message ?? 'An error occurred';
      }
    } catch (e) {
      message = "Error: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
