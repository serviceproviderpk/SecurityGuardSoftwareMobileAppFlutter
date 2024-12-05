import 'package:flutter/material.dart';

import '../models/attendance_model.dart';
import '../services/attendance_api-services.dart';

class AttendanceViewModel extends ChangeNotifier {
  final AttendanceApiService _apiService = AttendanceApiService();
  List<Attendance> attendanceList = [];
  bool isLoading = true;
  String errorMessage = '';

  Future<void> fetchAttendanceData() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      attendanceList = await _apiService.fetchAttendanceData();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
