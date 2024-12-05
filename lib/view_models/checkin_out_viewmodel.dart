import 'package:flutter/foundation.dart';
import 'package:securitymanagementsystem/services/checkedin_out_api_services.dart';

import '../models/checkinout_model.dart';

class CheckInOutViewModel extends ChangeNotifier {
  final CheckInOutApiService _apiService = CheckInOutApiService();
  String _message = '';
  bool _isLoading = false;

  String get message => _message;

  bool get isLoading => _isLoading;

  Future<void> performCheckInOut(String type) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.checkInOut(
        organizationId: 185,
        branchId: 186,
        loginUserId: 187,
        checkInOutType: type,
      );

      CheckInOutResponse checkInOutResponse =
          CheckInOutResponse.fromJson(response);
      _message = checkInOutResponse.message;
    } catch (e) {
      _message = "Error: $e";
    }

    _isLoading = false;
    notifyListeners();
  }
}
