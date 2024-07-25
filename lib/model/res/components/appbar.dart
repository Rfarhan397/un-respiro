import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

class AppbarWidget extends StatelessWidget {
  final String text;
  final Color color;
   double bottomLeft,bottomRight,fontSize;
   double? width,height;
   bool isGradient;
   AppbarWidget({super.key,
     required this.text,
     this.color = AppColors.appBarColor,
     this.bottomLeft = 80,
     this.bottomRight = 80,
     this.fontSize = 18,
     this.isGradient = false,
     this.height,
     this.width,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      width: width ?? Get.width,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isGradient ? Colors.red : color,
              isGradient ? Colors.yellow : color,
            ]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 20,
              spreadRadius: 10,
            )
          ],
          borderRadius: BorderRadius.only(

              bottomLeft: Radius.circular(bottomLeft,),
              bottomRight: Radius.circular(bottomRight))
      ),
      child: AppTextWidget(text:text ?? "",fontSize: fontSize,textAlign: TextAlign.center,)
    );
  }
}
