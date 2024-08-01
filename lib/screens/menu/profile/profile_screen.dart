import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/model/res/components/appbar.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';
import 'package:unrespiro/model/res/widgets/hours_text.dart';

import '../../../model/res/routes/routes_name.dart';
import '../../../provider/theme/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;

    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     Switch(
      //       value: themeProvider.isDarkMode,
      //       onChanged: (value) {
      //         themeProvider.toggleTheme();
      //       },
      //     ),
      //   ],
      // ),
      body: SafeArea(child: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Stack(children: [
            Container(
              height: Get.height/1.8,
              width: Get.width,
              decoration: BoxDecoration(
                  color: _isDark ? AppColors.appBarColor : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 2),
                      color: _isDark ? Colors.black:AppColors.appDarkPurpleColor,
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(200),
                      bottomLeft: Radius.circular(200),
                  ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 170,),
                  AppTextWidget(text: 'Natalia',fontSize:16,color: _isDark ? Colors.white:Colors.black,fontWeight: FontWeight.bold,),
                  SizedBox(height: 5,),
                  AppTextWidget(text: 'Nata03@gmail.com',color: AppColors.appBarColor,),
                  SizedBox(height: 10,),
                  Container(
                    height: 18,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,
                    ),
                    child: AppTextWidget(text: 'PRO'),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        HoursText(text: '32', text2: 'Hours', text3: 'Saved', text4: 'hrs'),
                        HoursText(text: '60', text2: 'Attempts', text3: 'blocked', text4: 'hrs'),
                        HoursText(text: '09', text2: 'Blocked', text3: 'apps', text4: 'hrs')


                      ],
                    ),
                  ),
                ],
              ),
            ),
                  AppbarWidget(
                  text: 'Profile',
                    color: primaryColor,
                    image: AppAssets.profileBg,
                    textColor: _isDark ? Colors.white:Colors.black,
                    icon: Icons.arrow_back_ios,
                    onTap: (){Get.back();},
                    isGradient: _isDark ?  true : false,
                    height: 170,bottomLeft: 250,bottomRight: 250,),
            Image.asset(AppAssets.profileShadow),
            Positioned(
                top: Get.height/7.5,
                left: Get.width/2.8,
                child: CircleAvatar(
                  radius: 50,
              backgroundImage: AssetImage(AppAssets.girl),
            )),
            Positioned(
                left: Get.width/1.8,
                top: Get.height/4.2,
                child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(AppAssets.pencil,),
              ),
            )),
            Positioned(
              top: Get.height / 1.8,
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: (){},
                            title: AppTextWidget(
                              text: 'Edit Account',
                              fontSize: 14,
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                          ),
                          ListTile(
                            onTap: (){},
                            title: AppTextWidget(
                                text: 'Change Plan',
                                fontSize: 14,
                                textAlign: TextAlign.start),
                            trailing: Icon(Icons.arrow_forward_ios,size: 16),
                          ),
                          ListTile(
                            onTap: (){
                              Get.toNamed(RoutesName.metricsScreen);
                            },
                            title: AppTextWidget(
                                text: 'Metrics',
                                fontSize: 14,
                                textAlign: TextAlign.start),
                            trailing: Icon(Icons.arrow_forward_ios,size: 16)
                          ),
                          ListTile(
                            onTap: (){},
                            title: AppTextWidget(
                                text: 'Friends',
                                fontSize: 14,
                                color: Colors.grey,
                                textAlign: TextAlign.start),
                            trailing: Container(
                              height: 20,
                              width: 90,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,

                              ),
                              child: Center(child: AppTextWidget(
                                fontSize: 12,
                                text: 'Coming soon',
                                color: Colors.white,
                              )),
                            ),
                          ),ListTile(
                            onTap: (){},
                            title: AppTextWidget(
                                text: 'Connect with Calendar',
                                color: Colors.grey,
                                textAlign: TextAlign.start
                            ),
                            trailing: Container(
                              height: 20,
                              width: 90,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,
                              ),
                              child: Center(
                                  child: AppTextWidget(
                                    fontSize: 12,
                                    text: 'Coming soon',
                                    color: Colors.white,)),
                            ),
                          ),
                        ],
                      ),
                    )
        
                  ],
                )
              ),
            ),
        
                  ],
          ),
        ),
      )),
    );
  }
  }