import 'package:flutter/material.dart';

import '../models/my_schedule_model.dart';
import '../services/my_schedules_api_service.dart';

class MyScheduleViewModel extends ChangeNotifier {
  final MyScheduleApiService _apiService = MyScheduleApiService();

  List<MyScheduleModel> _schedules = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MyScheduleModel> get schedules => _schedules;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> fetchSchedules() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _schedules = await _apiService.fetchMessages();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
