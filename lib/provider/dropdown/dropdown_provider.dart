// import 'package:flutter/material.dart';
//
// class DropdownProvider with ChangeNotifier {
//   String _selectedOption = 'Monthly';
//
//   String get selectedOption => _selectedOption;
//
//   void setSelectedOption(String option) {
//     _selectedOption = option;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';

class DropdownProvider with ChangeNotifier {
  String _selectedOption = "Monthly"; // Default option
  bool _isDropdownVisible = false;

  String get selectedOption => _selectedOption;
  bool get isDropdownVisible => _isDropdownVisible;

  void setSelectedOption(String option) {
    _selectedOption = option;
    notifyListeners();
  }

  void toggleDropdownVisibility() {
    _isDropdownVisible = !_isDropdownVisible;
    notifyListeners();
  }
}
