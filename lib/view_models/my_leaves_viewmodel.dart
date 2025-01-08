import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/models/my_leaves_model.dart';
import 'package:securitymanagementsystem/services/my_leaves_api_services.dart';

class MyLeavesViewmodel extends ChangeNotifier {
  final MyLeavesApiServices _apiService = MyLeavesApiServices();

  List<MyLeavesModel> _schedules = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MyLeavesModel> get schedules => _schedules;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> fetchSchedules() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _schedules = await _apiService.fetchLeaveData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
