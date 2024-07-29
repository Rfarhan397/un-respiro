import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/model/res/components/appbar.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

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
                  SizedBox(height: 150,),
                  AppTextWidget(text: 'Natalia',fontSize:18,color: _isDark ? Colors.white:Colors.black,fontWeight: FontWeight.bold,),
                  SizedBox(height: 5,),
                  AppTextWidget(text: 'Nata03@gmail.com',color: AppColors.appBarColor,),
                  SizedBox(height: 15,),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildHoursColumn('32','Hours','saved',context),
                      buildHoursColumn('60','Attempts','blocked',context),
                      buildHoursColumn('09','Blocked','apps',context),
        
                    ],
                  ),
                ],
              ),
            ),
                  AppbarWidget(
                  text: 'Profile',
                    color: primaryColor,
                    secondColorGradient:lightPurpleColor,
                    textColor: _isDark ? Colors.white:Colors.black,
                    icon: Icons.arrow_back_ios,
                    onTap: (){Get.back();},
                    isGradient: _isDark ?  true : false,
                    height: 180,bottomLeft: 250,bottomRight: 250,),
            Positioned(
                top: Get.height/8,
                left: Get.width/2.8,
                child: CircleAvatar(
                  radius: 50,
              backgroundImage: AssetImage(AppAssets.girl),
            )),
            Positioned(
                left: Get.width/1.8,
                top: Get.height/5,
                child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,
              ),
              child: Icon(Icons.edit,color: Colors.white,),
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
                              fontSize: 16,
                              textAlign: TextAlign.start,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            onTap: (){},
                            title: AppTextWidget(
                                text: 'Change Plan',
                                fontSize: 16,
                                textAlign: TextAlign.start),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            onTap: (){
                              Get.toNamed(RoutesName.metricsScreen);
                            },
                            title: AppTextWidget(
                                text: 'Metrics',
                                fontSize: 16,
                                textAlign: TextAlign.start),
                            trailing: Icon(Icons.arrow_forward_ios)
                          ),
                          ListTile(
                            onTap: (){},
                            title: AppTextWidget(
                                text: 'Friends',
                                fontSize: 16,
                                color: Colors.grey,
                                textAlign: TextAlign.start),
                            trailing: Container(
                              height: 25,
                              width: 90,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,

                              ),
                              child: Center(child: AppTextWidget(
                                text: 'Coming soon',
                                color: Colors.white,
                              )),
                            ),
                          ),ListTile(
                            onTap: (){},
                            title: AppTextWidget(
                                text: 'Connect with Calendar',
                                fontSize: 16,
                                color: Colors.grey,
                                textAlign: TextAlign.start
                            ),
                            trailing: Container(
                              height: 25,
                              width: 90,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,
                              ),
                              child: Center(
                                  child: AppTextWidget(
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

  Column buildHoursColumn(String text,text2,text3,context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Column(
                    children: [
                      Text.rich(
                          TextSpan(
                              text: text,
                              style: TextStyle(fontSize: 18,
                                  color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,
                                  fontWeight: FontWeight.bold,),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: ' hrs'?? '',
                                  style: TextStyle(fontSize: 12,
                                    color: _isDark ? AppColors.appYellowColor.withOpacity(0.5):AppColors.appRedColor,
                                  ),
                                )
                              ]
                          )
                      ),
                      SizedBox(height: 3,),
                      Text ( text2,style: TextStyle(color: Colors.grey,fontSize: 10),),
                      Text ( text3,style: TextStyle(color: Colors.grey,fontSize: 10),),
                    ],
                  );
  }
}
