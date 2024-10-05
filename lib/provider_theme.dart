import 'package:flutter/material.dart';

class ProviderTheme extends ChangeNotifier {
  bool _isDarkMode = false;

  bool getThemeValue() => _isDarkMode;

  void updateTheme({required bool value}) {
    _isDarkMode = value;
    notifyListeners();
  }
}
