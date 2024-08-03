import 'package:flutter/cupertino.dart';

class ToggleModel with ChangeNotifier {
  static final ToggleModel _instance = ToggleModel._internal();

  factory ToggleModel() {
    return _instance;
  }

  ToggleModel._internal();

  bool _isCronometer = false;

  bool get isCronometer => _isCronometer;

  void toggle() {
    _isCronometer = !_isCronometer;
    notifyListeners();
  }
}
