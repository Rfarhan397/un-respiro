import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

import '../../../provider/theme/theme_provider.dart';

class AppbarWidget extends StatelessWidget {
  final String text;
  final String? image;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color color,textColor,secondColorGradient;
   double bottomLeft,bottomRight,topRight,topLeft,fontSize;
   double? width,height;
   bool isGradient;
   AppbarWidget({super.key,
     required this.text,
     this.image,
     this.icon,
     this.color = AppColors.appBarColor,
     this.secondColorGradient = AppColors.appBarColor,
     this.textColor = Colors.grey,
     this.bottomLeft = 80,
     this.bottomRight = 80,
     this.topRight = 30,
     this.topLeft = 30,
     this.fontSize = 18,
     this.isGradient = false,
     this.height,
     this.width,
     this.onTap,
   });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;

    return Container(
      height: height ?? 100,
      width: width ?? Get.width,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image ?? '')),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRight),
              topLeft: Radius.circular(topLeft),

              bottomLeft: Radius.circular(bottomLeft,),
              bottomRight: Radius.circular(bottomRight))
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            GestureDetector(
                onTap:onTap,
                child: Icon(icon,size: 20,)),
            SizedBox(width: Get.width/3.7,),
            AppTextWidget(
              fontWeight: FontWeight.bold,
              color: textColor,
              text:text ?? "",fontSize: fontSize,textAlign: TextAlign.center,),
          ],
        ),
      )
    );
  }
}
