import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_string.dart';
import 'package:unrespiro/model/res/routes/routes_name.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';
import 'package:unrespiro/model/res/widgets/button_widget.dart';

import '../../provider/theme/theme_provider.dart';
class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Theme Provider'),
        actions: [
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(Get.width * 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                   width: Get.width,
                    height: Get.width * 0.8,
                    child: Image.asset(AppAssets.mobileImage,fit: BoxFit.contain,)),
                 SizedBox(height: Get.width * 0.12,),
                const AppTextWidget(text: AppString.confirm_text,fontSize: 14.0,textAlign: TextAlign.center,),
                 SizedBox(height: Get.width * 0.12,),
                ButtonWidget(text: "Login", onClicked: (){
                  Get.toNamed(RoutesName.loginScreen);
                }, width: Get.width * 0.54, height: 40.0),
                const SizedBox(height: 10.0,),
                ButtonWidget(text: "Register", onClicked: (){},
                  width: Get.width * 0.54,
                  height: 40.0,
                  borderColor: primaryColor,
                  oneColor: true,
                  isShadow: _isDark ? true : false,
                  textColor: _isDark ? Colors.white :Colors.black,
                 backgroundColor: _isDark ? darkGrey : Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
