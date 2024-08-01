import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';

import '../../../provider/theme/theme_provider.dart';

class CircularIndicatorWithEndCircle extends StatelessWidget {
  final double percentage;

  CircularIndicatorWithEndCircle({required this.percentage});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;

    return Expanded(
      flex: 1,
      child: CircularPercentIndicator(
        radius: 60.0,
        lineWidth: 2.0,
        percent: percentage / 100,
        center: Align(
          alignment: Alignment.center,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: _isDark ? AppColors.appBarColor : AppColors.appDarkPurpleColor,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Center(
              child: Text(
                "${percentage.toInt()}%",
                style: TextStyle(
                  fontSize: 40.0,
                  color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                ),
              ),
            ),
          ),
        ),
        progressColor: _isDark ? Colors.orange : AppColors.appRedColor,
        backgroundColor: _isDark ? Colors.grey[800]! : AppColors.appDarkPurpleColor,
        circularStrokeCap: CircularStrokeCap.round,
        widgetIndicator: Align(
          alignment: Alignment.center,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isDark ? Colors.orange : AppColors.appRedColor,
            ),
          ),
        ),
      ),
    );
  }
}
