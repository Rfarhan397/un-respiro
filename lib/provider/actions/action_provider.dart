import 'package:flutter/cupertino.dart';

class ActionProvider extends ChangeNotifier {
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  ActionProvider(){
    _isVisible = false;
    notifyListeners();
  }

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void hide() {
    _isVisible = false;
    notifyListeners();
  }
}