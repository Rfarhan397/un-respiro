import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_string.dart';
import 'package:unrespiro/model/res/routes/routes_name.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';
import 'package:unrespiro/model/res/widgets/button_widget.dart';

import '../../model/res/constant/app_colors.dart';
import '../../provider/theme/theme_provider.dart';
class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Flutter Theme Provider'),
      //   actions: [
      //     Switch(
      //       value: themeProvider.isDarkMode,
      //       onChanged: (value) {
      //         themeProvider.toggleTheme();
      //       },
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            _isDark? Container(
              margin: EdgeInsets.symmetric(vertical: 100,horizontal: 50),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppColors.appYellowColor.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                      Colors.black,
                    ],
                  )
              ),
            ):
            Container(
              //margin: EdgeInsets.symmetric(vertical: 100,horizontal: 50),
              decoration: BoxDecoration(
                color: Color(0xffEAE1E1).withOpacity(0.8)
                  // gradient: LinearGradient(colors: [
                  //   Colors.pink.withOpacity(0.1),
                  //   Colors.white,
                  //   AppColors.appDarkPurpleColor
                  //
                  // ],
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter
                  // )
              ),
            ),
            Padding(
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
                  const AppTextWidget(
                    text: AppString.confirm_text,fontWeight: FontWeight.w400,fontSize: 14.0,textAlign: TextAlign.center,),
                   SizedBox(height: Get.width * 0.12,),
                  ButtonWidget(text: "Login",
                      fontWeight: FontWeight.w700,
                      onClicked: (){
                    Get.toNamed(RoutesName.loginScreen);
                  }, width: Get.width * 0.54, height: 40.0),
                  const SizedBox(height: 10.0,),
                  ButtonWidget(

                    text: "Register", onClicked: (){},
                    fontWeight: FontWeight.w600,
                    width: Get.width * 0.54,
                    height: 40.0,
                    borderColor: _isDark ?AppColors.appYellowColor : AppColors.appRedColor,
                    oneColor: true,
                    isShadow: _isDark ? true : false,
                    textColor: _isDark ? Colors.white :AppColors.appRedColor,
                   backgroundColor: _isDark ? darkGrey : Color(0xffEAE1E1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
