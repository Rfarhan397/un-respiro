import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme/theme_provider.dart';
import '../constant/app_colors.dart';

class HoursText extends StatelessWidget {
  final String text,text2,text3,text4;
  const HoursText({
  Key? key,
  required this.text,
    required this.text2,
    required this.text3,
    required this.text4,




  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Column(
      children: [
        Text.rich(
            TextSpan(
                text: text,
                style: TextStyle(fontSize: 16,
                  color: _isDark ? AppColors.appYellowColor : AppColors
                      .appRedColor,
                  ),
                children: <InlineSpan>[
                  TextSpan(
                    text: text4,
                    style: TextStyle(fontSize: 12,
                      color: _isDark
                          ? AppColors.appYellowColor.withOpacity(0.5)
                          : AppColors.appRedColor,
                    ),
                  ),
                ]
            )
        ),
        SizedBox(height: 3,),
        Text(text2, style: TextStyle(color: Colors.grey, fontSize: 10),),
        Text(text3, style: TextStyle(color: Colors.grey, fontSize: 10),),
      ],
    );;
  }
}
