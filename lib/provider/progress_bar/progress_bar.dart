import 'package:flutter/material.dart';

class ProgressModel with ChangeNotifier {
  final Map<String, Duration> _progress = {
    'Monday': Duration(minutes: 30),
    'Tuesday': Duration(minutes: 45),
    'Wednesday': Duration(minutes: 27),
    'Thursday': Duration(hours: 1, minutes: 10),
    'Friday': Duration(hours: 1, minutes: 30),
    'Saturday': Duration(minutes: 40),
    'Sunday': Duration(minutes: 10),
  };

  Map<String, Duration> get progress => _progress;
}
