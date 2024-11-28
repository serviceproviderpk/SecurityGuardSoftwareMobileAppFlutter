import 'package:flutter/material.dart';

class HeadingsNotifier extends ChangeNotifier {
  // Default Values
  String _text = 'Default Heading';
  TextStyle _style = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
  );

  // Getters
  String get text => _text;

  TextStyle get style => _style;

  // Setters
  void setHeading(String newText) {
    _text = newText;
    notifyListeners();
  }

  void setHeadingSize(TextStyle newStyle) {
    _style = newStyle;
    notifyListeners();
  }
}
