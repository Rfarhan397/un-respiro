import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/components/app_button_widget.dart';
import 'package:unrespiro/model/res/components/appbar.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/routes/routes_name.dart';
import 'package:unrespiro/provider/actions/action_provider.dart';

import '../../model/res/components/custom_alertbox_scrollable.dart';
import '../../model/res/constant/app_assets.dart';
import '../../model/res/constant/app_string.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../model/res/widgets/button_widget.dart';
import '../../provider/theme/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          onPressed: () {
            Provider.of<ActionProvider>(context, listen: false)
                .toggleVisibility();
          },
          child: Consumer<ActionProvider>(
            builder: (context, provider, child) {
              return Visibility(
                  visible: !provider.isVisible,
                  child: _isDark
                      ? Image.asset(
                          AppAssets.gift,
                        )
                      : Image.asset(
                          AppAssets.giftR,
                        ));
            },
          ),
        ),
      ),
      // appBar: AppBar(
      //   title: AppTextWidget(
      //     text: 'Home',fontSize: 18,),
      //   centerTitle: true,
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
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //appBar
              Padding(
                padding: EdgeInsets.all(
                  Get.width * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // Image.asset(
                        //   _isDark? AppAssets.backIconL:
                        //   AppAssets.backIcon,
                        //   height: 30,
                        //   width: 30,
                        // ),
                        SizedBox(
                          width: Get.width / 2.5,
                        ),
                        AppTextWidget(
                          text: 'HOME',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Container(
                        width: Get.width,
                        height: Get.height * 0.4,
                        child: Image.asset(
                          _isDark ? AppAssets.homeMap : AppAssets.homeMapl,
                          fit: BoxFit.cover,

                        )),
                    Center(
                      child: ButtonWidget(
                          text: "Ver métricas",
                          textSize: 14,
                          onClicked: () {},
                          width: Get.width * 0.35,
                          height: 36.0),
                    ),
                    SizedBox(
                      height: Get.width * 0.12,
                    ),
                    Container(
                      height: Get.height /4.5,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesName.Instagram);
                            },
                            child: Column(
                              children: [
                                buildStackWidget(_isDark, AppAssets.insta),
                                SizedBox(
                                  height: 15,
                                ),
                                buildStackWidget(_isDark, AppAssets.tiktok),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              buildStackWidget(_isDark, AppAssets.x),
                              SizedBox(
                                height: 15,
                              ),
                              buildStackWidget(_isDark, AppAssets.pinterest),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  CustomAlertDialog(),
                            );
                          },
                          child: Icon(
                            Icons.add_circle_outline,
                             size: 40,
                             color:  _isDark ? AppColors.appYellowColor:AppColors.appRedColor )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Consumer<ActionProvider>(
                builder: (context, provider, child) {
                  return Visibility(
                    visible: provider.isVisible,
                    child: Positioned(
                      top: 10,
                      left: 170,
                      child: Container(
                        width: Get.width / 2,
                        height: Get.height / 3.2,
                        decoration: BoxDecoration(
                          color: _isDark
                              ? Colors.grey.withOpacity(0.2)
                              : Color(0xffDDD3E6).withOpacity(0.5),
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
                                  color: _isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  AppAssets.giftIcon,
                                  height: 45,
                                  color: _isDark
                                      ? AppColors.appYellowColor
                                      : AppColors.appRedColor,
                                ),
                                SizedBox(height: 15),
                                AppTextWidget(
                                  text: 'Win a gift',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: _isDark ? Colors.white : Colors.black,
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: AppTextWidget(
                                    text:
                                        'Explanation of the reward system for users',
                                    textAlign: TextAlign.center,
                                    fontSize: 12,
                                    color:
                                        _isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(80, 20),
                                    backgroundColor: _isDark
                                        ? AppColors.appYellowColor
                                        : AppColors.appRedColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Add your onPressed code here!
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0),
                                    child: AppTextWidget(
                                      text: 'Ir',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildStackWidget(bool _isDark, String image) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: Get.width * 0.6,
          padding: EdgeInsets.only(left: 70, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: _isDark ? AppColors.appBarColor : Color(0xFFEDE7F6),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Intentos: 12',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: _isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    'Tiempo ahorrado: 30min.',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: _isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: _isDark ? AppColors.appBarColor : Color(0xFFEDE7F6),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: CircleAvatar(
              backgroundColor:
                  _isDark ? AppColors.appBarColor : Color(0xFFEDE7F6),
              radius: 25.0,
              child: Image.asset(
                image,
                width: 35.0,
                height: 35.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
