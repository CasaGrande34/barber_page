import 'package:flutter/material.dart';

class ThemeCharger extends ChangeNotifier {
  
  bool _isDark = false;
  bool get isDark => _isDark;
  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }
  
}