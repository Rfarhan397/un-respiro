import 'package:flutter/material.dart';

class MatricsPercentageProvider with ChangeNotifier {
  double _percentage = 80.0;

  double get percentage => _percentage;

  void setPercentage(double newPercentage) {
    _percentage = newPercentage;
    notifyListeners();
  }
}
