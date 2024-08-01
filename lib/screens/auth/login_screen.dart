import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text_field.dart';
import '../../constant.dart';
import '../../model/res/routes/routes_name.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../model/res/widgets/button_widget.dart';
import '../../provider/theme/theme_provider.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  var emailController = TextEditingController();

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
              gradient: LinearGradient(colors: [
                                  AppColors.appPurpleColor,
                                  Colors.white,
                                  AppColors.appDarkPurpleColor

                                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
          ),
        ),
            Padding(
              padding:  EdgeInsets.all(Get.width * 0.15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  AppTextWidget(text: 'un respiro',fontSize: 24.0,fontWeight: FontWeight.bold,),
                  SizedBox(height: Get.width * 0.18,),
              //                Image.asset('assets/images/appLogo.png',height: 50,width: Get.width/2,),

                  AppTextField(
                    hintText: "Mail",

                    controller: emailController,
                    validator: (email) {
                      if (emailController.text.isNotEmpty) {
                        return null;
                      } else {
                        return 'Required';
                      }
                    },
                  ),

                  SizedBox(height: Get.width * 0.020,),
                  AppTextField(hintText: "Password",),
                  SizedBox(height: Get.width * 0.040,),
                  AppTextWidget(text: 'Forget you password?', textDecoration: TextDecoration.underline,fontSize: 12,),
                  SizedBox(height: Get.width * 0.090,),
                  Container(
                    height: 40,
                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _isDark? Colors.white : primaryColor,
                        width: 1.0,
                      ),
                      color: _isDark ? darkGrey : Colors.orangeAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular( 50),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 5,),
                        Image.asset(AppAssets.google,height: 40,width: 40,),
                        SizedBox(width: 20,),
                        AppTextWidget(text: 'Sign in with Google',fontSize: 14,)
                      ],
                    ),
                  ),
                  SizedBox(height: Get.width * 0.020,),
                  Container(
                    height: 40,
                    //padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _isDark? Colors.white : primaryColor,
                        width: 1.0,
                      ),
                      color: _isDark ? darkGrey : Colors.orangeAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular( 50),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.apple,
                        color: _isDark ? Colors.white:Colors.black,
                        ),
                        SizedBox(width: 25,),
                        AppTextWidget(text: 'Sign in with Apple',fontSize: 14,)
                      ],
                    ),
                  ),

                  SizedBox(height: Get.width * 0.070,),
                  ButtonWidget(
                      text: "Login",
                      onClicked: (){
                    Get.toNamed(RoutesName.permissionScreen);

                  },
                      width: Get.width * 0.70, height: 45.0),
                  SizedBox(height: Get.width * 0.040,),
                  AppTextWidget(
                    text: 'Login without registering',
                    textDecoration: TextDecoration.underline,
                    fontSize: 12,
                  )
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: 40,
              right: 40,
              child:  Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  // Adjust transparency to suit your needs
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
