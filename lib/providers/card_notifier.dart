import 'package:flutter/material.dart';

class CardNotifier extends ChangeNotifier {
  IconData _iconData = Icons.home;
  String _title = 'Icons';

  VoidCallback? _action;

  String get title => _title;

  IconData get iconData => _iconData;

  VoidCallback? get action => _action;

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setIcon(IconData iconData) {
    _iconData = iconData;
    notifyListeners();
  }

  void setMessage(String message) {
    notifyListeners();
  }

  void setAction(VoidCallback? action) {
    _action = action;
    notifyListeners();
  }
}
