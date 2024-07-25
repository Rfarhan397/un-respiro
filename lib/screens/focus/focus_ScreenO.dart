import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/widgets/button_widget.dart';
import 'package:unrespiro/screens/focus/component/number_buttons.dart';
import '../../model/res/components/toggle_button.dart';
import '../../model/res/constant/app_colors.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../provider/theme/theme_provider.dart';
import 'component/clock.dart';

class FocusScreenO extends StatefulWidget {
  FocusScreenO({super.key});

  @override
  State<FocusScreenO> createState() => _FocusScreenOState();
}

class _FocusScreenOState extends State<FocusScreenO> {


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: AppTextWidget(
            text: 'Focus Mode',
            fontSize: 16,
          ),
          centerTitle: true,
          actions: [
            Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: Get.height / 1.6,
                  decoration: BoxDecoration(
                    color:
                        _isDark ? Color(0xff111111) : AppColors.appPurpleColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ToggleButton(),
                        SizedBox(
                          height: 20,
                        ),
                        ClockScreen(),
                        //NumbersButton(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                          child: AppTextWidget(
                        text: 'Registered applications',
                        fontSize: 16,
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildLogo(AppAssets.insta, true, '00:15:01'),
                              buildLogo(AppAssets.tiktok, true, '00:15:01'),
                              buildLogo(AppAssets.x, true, '00:15:01'),
                              buildLogo(AppAssets.pinterest, true, '00:15:01'),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildLogo(AppAssets.dummy, false, '00:15:01'),
                              buildLogo(AppAssets.dummy, false, '00:15:01'),
                              buildLogo(AppAssets.dummy, false, '00:15:01'),
                              buildLogo(AppAssets.dummy, false, '00:15:01'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Stack buildLogo(String image, bool isCheck, String text) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Instagram Icon
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff111111)),
              child: Image.asset(
                image,
                width: 120,
                height: 120,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xff111111),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: AppTextWidget(text: text))),
          ],
        ),
        // Green Check Mark
        Positioned(
          top: 0,
          left: 3,
          child: Container(
            decoration: BoxDecoration(
                color: isCheck ? Colors.green : Colors.white,
                borderRadius: BorderRadius.circular(10)),
            width: 20,
            height: 20,
            child: Icon(
              Icons.check,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }



}
