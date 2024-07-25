import 'package:flutter/material.dart';

class DropdownProvider with ChangeNotifier {
  String _selectedOption = 'Monthly';

  String get selectedOption => _selectedOption;

  void setSelectedOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }
}
