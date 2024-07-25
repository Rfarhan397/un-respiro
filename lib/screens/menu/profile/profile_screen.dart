import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unrespiro/model/res/components/appbar.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

import '../../../model/res/routes/routes_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        height: Get.height,
        child: Stack(children: [
          Container(
            height: Get.height/1.9,
            width: Get.width,
            decoration: BoxDecoration(
                color: AppColors.appBarColor,
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
                AppTextWidget(text: 'Natalia',fontSize:18,color: Colors.white,),
                SizedBox(height: 5,),
                AppTextWidget(text: 'Nata03@gmail.com',color: AppColors.appBarColor,),
                SizedBox(height: 15,),
                Container(
                  height: 18,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.appYellowColor,
                  ),
                  child: AppTextWidget(text: 'PRO'),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildHoursColumn('32','Hours','saved'),
                    buildHoursColumn('60','Attempts','blocked'),
                    buildHoursColumn('09','Blocked','apps'),

                  ],
                ),
              ],
            ),
          ),
                AppbarWidget(
                text: 'Profile',
                  isGradient: true,
                  height: 140,bottomLeft: 200,bottomRight: 200,),
          Positioned(
              top: Get.height/11,
              left: Get.width/3,
              child: CircleAvatar(
                radius: 60,
            backgroundImage: AssetImage(AppAssets.girl),
          )),
          Positioned(
              left: Get.width/1.8,
              top: Get.height/5.3,
              child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.appYellowColor,
            ),
            child: Icon(Icons.edit,color: Colors.white,),
          )),
          Positioned(
            top: Get.height / 1.8,
            child: Container(
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
                                color: AppColors.appYellowColor
                            ),
                            child: Center(child: AppTextWidget(text: 'Coming soon')),
                          ),
                        ),ListTile(
                          onTap: (){},
                          title: AppTextWidget(
                              text: 'Connect with Calendar',
                              fontSize: 16,
                              color: Colors.grey,
                              textAlign: TextAlign.start),
                          trailing: Container(
                            height: 25,
                            width: 90,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.appYellowColor
                            ),
                            child: Center(child: AppTextWidget(text: 'Coming soon')),
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
      )),
    );
  }

  Column buildHoursColumn(String text,text2,text3,) {
    return Column(
                    children: [
                      Text.rich(
                          TextSpan(
                              text: text,
                              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: AppColors.appYellowColor),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'hrs'?? '',
                                  style: TextStyle(fontSize: 14),
                                )
                              ]
                          )
                      ),
                      SizedBox(height: 3,),
                      Text ( text2,style: TextStyle(color: Colors.grey,fontSize: 12),),
                      Text ( text3,style: TextStyle(color: Colors.grey,fontSize: 12),),
                    ],
                  );
  }
}
