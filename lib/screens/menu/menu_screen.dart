import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_string.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';
import 'package:unrespiro/model/res/widgets/button_widget.dart';
import '../../constant.dart';
import '../../model/res/components/appbar.dart';
import '../../model/res/components/appbarSimple.dart';
import '../../model/res/constant/app_colors.dart';
import '../../model/res/routes/routes_name.dart';
import '../../provider/actions/action_provider.dart';
import '../../provider/theme/theme_provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Scaffold(

     // appBar:  AppBar(
     //    actions: [
     //      Switch(
     //        value: themeProvider.isDarkMode,
     //        onChanged: (value) {
     //          themeProvider.toggleTheme();
     //        },
     //      ),
     //    ],
     //  ),
      backgroundColor: _isDark ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          children: [
            Column(
              children: [
                AppbarSimpleWidget(
                  text: 'More',
                  textColor: Colors.black,
                  color: _isDark ?AppColors.appBarColor:AppColors.appDarkPurpleColor,
                  secondColorGradient: _isDark ? AppColors.appBarColor : AppColors.appDarkPurpleColor,
        
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Get.width* 0.200),
                  child: Row(
                    children: [
                      Center(
                          child:
                              ButtonWidget(text: 'Activate Punishment Mode',
                                  textSize: 12,
                                  onClicked: (){},
                                  width: Get.width/2, height: 40)
                              //AppTextWidget(text: 'Activate Punishment Mode',color: ,)
                        ),
                      SizedBox(
                        width: Get.width*0.020,
                      ),
                      GestureDetector(
                          onTap: () {
                            Provider.of<ActionProvider>(context, listen: false)
                                .toggleVisibility();
                          },
                          child: Icon(
                            Icons.info_outline,
                            color: _isDark ?AppColors.appYellowColor:AppColors.appRedColor,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Get.toNamed(RoutesName.profileScreen);
                        },
                        title: AppTextWidget(
                          text: 'Profile',
                          fontSize: 14,
                          textAlign: TextAlign.start,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                      ),
                      ListTile(
                        onTap: (){},
                        title: AppTextWidget(
                            fontSize: 14,
                            text: 'Adjusts', textAlign: TextAlign.start),
                        trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                      ),
                      ListTile(
                        onTap: (){
                          Get.toNamed(RoutesName.planScreen);
                        },
                        title: AppTextWidget(
                            fontSize: 14,
                            text: 'Plans', textAlign: TextAlign.start),
                        trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                      ),
                      ListTile(
                        onTap: (){},
                        title: AppTextWidget(
                            fontSize: 14,
                            text: 'Copy invitation link to Unrespiro',
                            textAlign: TextAlign.start),
                        trailing: Icon(Icons.link,size: 16,),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Container(
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        // width: Get.width/1.4,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [
                                _isDark ? AppColors.appBarColor : primaryColor,
                                _isDark ? AppColors.appBarColor : lightPurpleColor,
                                ],
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextWidget(text: 'Join the club',color: Colors.white,fontSize: 14,),
                            Image.asset(
                              AppAssets.discord,
                              cacheHeight: 16,
                              color: _isDark ? Color(0xFF5865F2):Colors.white ,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: Get.height * 0.20,
              left: Get.width * 0.26,
              child: Consumer<ActionProvider>(
                builder: (context, provider, child) {
                  return Visibility(
                    visible: provider.isVisible,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: Get.width / 1.9,
                        height: Get.height / 4,
                        decoration: BoxDecoration(
                          color: _isDark ? AppColors.appYellowColor:AppColors.appDarkPurpleColor,
                          borderRadius: BorderRadius.only(

                              bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  provider.toggleVisibility();
                                },
                                child: Icon(
                                  Icons.close,
                                  color: _isDark ? Colors.white:Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  AppTextWidget(
                                    text: AppString.confirm_text,),
                                  AppTextWidget(
                                    text: AppString.confirm_text,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
