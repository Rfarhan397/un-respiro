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
        child: Padding(
          padding:  EdgeInsets.all(Get.width * 0.15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                    
                    
                AppTextWidget(text: 'un respiro',fontSize: 24.0,fontWeight: FontWeight.bold,),
                SizedBox(height: Get.width * 0.22,),
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
                AppTextField(hintText: "Password"),
                SizedBox(height: Get.width * 0.040,),
                AppTextWidget(text: 'Forget you password?', textDecoration: TextDecoration.underline,fontSize: 12,),
                SizedBox(height: Get.width * 0.090,),
                Container(
                  height: 50,
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _isDark? Colors.grey : primaryColor,
                      width: 1.0,
                    ),
                    color: _isDark ? darkGrey : Colors.orangeAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular( 50),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Image.asset(AppAssets.google,height: 40,width: 40,),
                      //SizedBox(width: 20,),
                      AppTextWidget(text: 'Sign in with Google',fontSize: 14,)
                    ],
                  ),
                ),
                SizedBox(height: Get.width * 0.020,),
                Container(
                  height: 50,
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _isDark? Colors.grey : primaryColor,
                      width: 1.0,
                    ),
                    color: _isDark ? darkGrey : Colors.orangeAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular( 50),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
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
                    
                }, width: Get.width * 0.54, height: 50.0),
                SizedBox(height: Get.width * 0.040,),
                AppTextWidget(text: 'Login without registering',textDecoration: TextDecoration.underline,fontSize: 12,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
