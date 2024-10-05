import 'package:flutter/material.dart';

class ConterProvider extends ChangeNotifier {
  int _count = 0;

  int getCount() => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void decrementCount() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
