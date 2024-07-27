import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../model/res/constant/app_assets.dart';
import '../../model/res/constant/app_string.dart';
import '../../model/res/routes/routes_name.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../model/res/widgets/button_widget.dart';
import '../../provider/theme/theme_provider.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return  Scaffold(
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
        child: Padding(
          padding:  EdgeInsets.all(Get.width * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: Get.width,
                  height: Get.width * 0.45,
                  child: Image.asset(_isDark ?  AppAssets.lockImage : AppAssets.lockImageL ,fit: BoxFit.contain,)),
              SizedBox(height: Get.width * 0.10,),
              AppTextWidget(text: 'Permission Required',fontSize: 18.0,fontWeight: FontWeight.bold,),
              SizedBox(height: Get.width * 0.10,),
              const AppTextWidget(text: AppString.confirm_text,fontSize: 12.0,textAlign: TextAlign.center,),
              SizedBox(height: Get.width * 0.10,),
              const AppTextWidget(text: AppString.permissiom_text,fontWeight:FontWeight.bold,fontSize: 14.0,textAlign: TextAlign.center,),
              SizedBox(height: Get.width * 0.12,),
              ButtonWidget(
                  text: "Permission", onClicked: (){
                Get.toNamed(RoutesName.mainScreen);
              }, width: Get.width * 0.50, height: 40.0),

            ],
          ),
        ),
      ),
    );
  }
}
