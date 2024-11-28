import 'package:flutter/material.dart';

class AppBarNotifier extends ChangeNotifier {
  String _title = 'My App';
  List<Widget> _actions = [];

  String get title => _title;

  List<Widget> get actions => _actions;

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setActions(List<Widget> actions) {
    _actions = actions;
    notifyListeners();
  }
}
