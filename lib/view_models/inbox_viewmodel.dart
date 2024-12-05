import 'package:flutter/foundation.dart';

import '../models/inbox_model.dart';
import '../services/inbox_api_services.dart';

class InboxViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Message> _messages = [];
  String _statusMessage = 'Loading...';
  List<bool> _isExpandedList = [];
  bool _isLoading = false;

  List<Message> get messages => _messages;

  String get statusMessage => _statusMessage;

  List<bool> get isExpandedList => _isExpandedList;

  bool get isLoading => _isLoading;

  Future<void> fetchMessages(int guardId) async {
    _isLoading = true;
    _statusMessage = 'Loading...';
    notifyListeners();

    try {
      _messages = await _apiService.fetchMessages(guardId);
      _isExpandedList = List<bool>.filled(_messages.length, false);
    } catch (e) {
      _statusMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleExpansion(int index) {
    _isExpandedList[index] = !_isExpandedList[index];
    notifyListeners();
  }
}
