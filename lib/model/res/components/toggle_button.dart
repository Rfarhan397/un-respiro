import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';

import '../../../provider/theme/theme_provider.dart';
import '../../../provider/toggle/toggle_provider.dart';

class ToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    var toggleModel = Provider.of<ToggleModel>(context);
    return SizedBox(
      width: Get.width * 0.6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (toggleModel.isCronometer) toggleModel.toggle();
              },
              child:  Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      !toggleModel.isCronometer  ? _isDark ?  Color(0xffFFCC38) :  Color(0xffFF5000) : _isDark ?  AppColors.appBlackColor :  AppColors.appDarkPurpleColor ,
                      !toggleModel.isCronometer  ? _isDark ?  Color(0xffFF5000) : lightPurpleColor :     _isDark ?  AppColors.appBlackColor :  AppColors.appDarkPurpleColor,
                    ],
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                child: Center(
                  child: Text(
                    'Timer',
                    style: TextStyle(
                      fontSize: 12,
                      color: _isDark ? Colors.white : !toggleModel.isCronometer ?  Colors.white : lightPurpleColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!toggleModel.isCronometer) toggleModel.toggle();
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      toggleModel.isCronometer  ? _isDark ?  Color(0xffFFCC38) :  Color(0xffFF5000) : _isDark ?  AppColors.appBlackColor :  AppColors.appDarkPurpleColor ,
                      toggleModel.isCronometer  ? _isDark ?  Color(0xffFF5000) : lightPurpleColor :     _isDark ?  AppColors.appBlackColor :  AppColors.appDarkPurpleColor,
                    ],
                  ),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                child: Center(
                  child: Text(
                    'Cronometer',
                    style: TextStyle(
                      fontSize: 12,
                      color: _isDark ? Colors.white : toggleModel.isCronometer ?  Colors.white : lightPurpleColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
