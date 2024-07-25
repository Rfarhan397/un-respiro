import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/widgets/app_text_field.dart';
import 'package:unrespiro/screens/splash/permission_screen.dart';

import '../../constant.dart';
import '../../model/res/constant/app_assets.dart';
import '../../model/res/constant/app_string.dart';
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


              AppTextWidget(text: 'un respiro',fontSize: 22.0,fontWeight: FontWeight.bold,),
              SizedBox(height: Get.width * 0.22,),

              AppTextField(
                  hintText: "mail",
                controller: emailController,
                // validator: (email) {
                //   if (emailController.text.isNotEmpty) {
                //     return null;
                //   } else {
                //     return 'Required';
                //   }
                // },
              ),
              SizedBox(height: Get.width * 0.020,),
              AppTextField(hintText: "mail"),
              SizedBox(height: Get.width * 0.070,),
              ButtonWidget(text: "Login", onClicked: (){
                Get.toNamed(RoutesName.permissionScreen);

              }, width: Get.width * 0.54, height: 50.0),
              const SizedBox(height: 10.0,),
              ButtonWidget(text: "Register", onClicked: (){},
                width: Get.width * 0.54,
                height: 50.0,
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
    );
  }
}
