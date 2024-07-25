import 'package:flutter/material.dart';

class ToggleModel with ChangeNotifier {
  bool _isCronometer = false;

  bool get isCronometer => _isCronometer;

  void toggle() {
    _isCronometer = !_isCronometer;
    notifyListeners();
  }
}
