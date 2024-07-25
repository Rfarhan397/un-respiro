import 'package:flutter/material.dart';

class ToggleModel extends ChangeNotifier {
  bool _isChronometer = true;

  bool get isCronometer => _isChronometer;

  void toggle() {
    _isChronometer = !_isChronometer;
    notifyListeners();
  }
}
