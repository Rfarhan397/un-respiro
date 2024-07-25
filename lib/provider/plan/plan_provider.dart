import 'package:flutter/material.dart';

class PlanProvider with ChangeNotifier {
  int _selectedPlan = 1; // Default value

  int get selectedPlan => _selectedPlan;

  void selectPlan(int plan) {
    _selectedPlan = plan;
    notifyListeners();
  }
}
