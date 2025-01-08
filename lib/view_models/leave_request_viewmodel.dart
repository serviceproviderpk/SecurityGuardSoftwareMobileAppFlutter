import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/leave_request_api.dart';

class LeaveRequestViewModel extends ChangeNotifier {
  final LeaveRequestApiService _leaveRequestApiService =
      LeaveRequestApiService();

  bool _isSubmitting = false;

  bool get isSubmitting => _isSubmitting;

  String _message = '';

  String get message => _message;

  // leave request
  Future<void> submitLeaveRequest(
    int scheduleId,
    int profileId,
    int guardId,
    String reason,
    DateTime fromDate,
    DateTime toDate,
    int leaveType,
    int workingDays,
  ) async {
    try {
      _isSubmitting = true;
      notifyListeners();

      // API request
      PostResponse response = await _leaveRequestApiService.postNotification(
        scheduleId,
        profileId,
        guardId,
        reason,
        fromDate,
        toDate,
        leaveType,
        workingDays,
      );

      // message from the API response
      _message = response.message;
      notifyListeners();
    } catch (e) {
      // errors
      print('Error: $e');
      _message = 'Failed to submit request.';
      notifyListeners();
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }
}
