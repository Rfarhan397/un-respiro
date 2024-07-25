import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_string.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';
import '../../model/res/components/appbar.dart';
import '../../model/res/constant/app_colors.dart';
import '../../model/res/routes/routes_name.dart';
import '../../provider/actions/action_provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              AppbarWidget(
                text: 'More',
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 40,
                      width: Get.width/2,
                      decoration: BoxDecoration(
                          color: AppColors.appBarColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child:
                              AppTextWidget(text: 'Activate Punishment Mode')),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Provider.of<ActionProvider>(context, listen: false)
                              .toggleVisibility();
                        },
                        child: Icon(
                          Icons.info_outline,
                          color: AppColors.appYellowColor,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  children: [
                    ListTile(
                      onTap: (){
                        Get.toNamed(RoutesName.profileScreen);
                      },
                      title: AppTextWidget(
                        text: 'Profile',
                        textAlign: TextAlign.start,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: (){},
                      title: AppTextWidget(
                          text: 'Adjusts', textAlign: TextAlign.start),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: (){
                        Get.toNamed(RoutesName.planScreen);
                      },
                      title: AppTextWidget(
                          text: 'Plans', textAlign: TextAlign.start),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: (){},
                      title: AppTextWidget(
                          text: 'Copy invitation link to Unrespiro',
                          textAlign: TextAlign.start),
                      trailing: Icon(Icons.link),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      // width: Get.width/1.4,
                      decoration: BoxDecoration(
                          color: AppColors.appBarColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTextWidget(text: 'Join the club'),
                          Image.asset(
                            AppAssets.discord,
                            cacheHeight: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: Get.height * 0.15,
            left: Get.width * 0.18,
            child: Consumer<ActionProvider>(
              builder: (context, provider, child) {
                return Visibility(
                  visible: provider.isVisible,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: Get.width / 1.7,
                      height: Get.height / 5,
                      decoration: BoxDecoration(
                        color: AppColors.appYellowColor,
                        borderRadius: BorderRadius.circular(20),
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
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                AppTextWidget(
                                  text: AppString.confirm_text,
                                ),
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
    );
  }
}
