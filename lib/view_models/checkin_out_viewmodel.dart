import 'package:flutter/material.dart';

import '../models/checkinout_model.dart';
import '../services/checkedin_out_api_services.dart';

class CheckInOutViewModel extends ChangeNotifier {
  final CheckInOutApiService _apiService = CheckInOutApiService();
  String _message = '';
  String _content = '';
  bool _isLoading = false;

  String get message => _message;

  String get content => _content;

  bool get isLoading => _isLoading;

  Future<void> performCheckInOut(String type) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.checkInOut(
        checkInOutType: type,
      );

      CheckInOutResponse checkInOutResponse =
          CheckInOutResponse.fromJson(response);

      _message = checkInOutResponse.message ?? "No message available";
      _content = checkInOutResponse.content ?? "No Content Available";
    } catch (e) {
      _message = "Error: $e";
      _content = '';
    }

    _isLoading = false;
    notifyListeners();
  }
}
