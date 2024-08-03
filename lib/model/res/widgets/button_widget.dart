import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';
import '../../../provider/theme/theme_provider.dart';
import '../constant/app_colors.dart';
import 'app_text.dart.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double textSize;
  final VoidCallback onClicked;
  final IconData? icon;
  final double width, height;
  final double radius;
  final bool loader, oneColor;


  final Color textColor, borderColor, backgroundColor;
  final bool isShadow;

  const ButtonWidget({
    Key? key,
    required this.text,
     this.fontWeight = FontWeight.normal,
    this.textSize = 15,
    required this.onClicked,
    required this.width,
    required this.height,
    this.radius = 50.0,
    this.loader = false,
    this.oneColor = false,
    this.textColor = Colors.white,
    this.borderColor = primaryColor,
    this.backgroundColor = primaryColor,
    this.isShadow = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: isDarkMode ? Border.all(

              color: Colors.transparent,width: 0.0)
              :
          Border.all(width: oneColor ? 1.0 :0.0,color: oneColor ? borderColor :Colors.transparent),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              oneColor ? backgroundColor : (isDarkMode ? primaryColor : primaryColor),
              oneColor ? backgroundColor : (isDarkMode ? secondaryColor : lightPurpleColor),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: isShadow ? 2 : 0,
              blurRadius: isShadow ? 5 : 0,
              offset: Offset(isShadow ? 0 : 0, isShadow ? 3 : 0),
            ),
          ],
        ),
        child: loader
            ? const CircularProgressIndicator(
          color: AppColors.appBackgroundColor,
        )
            : Center(
          child: AppTextWidget(
            text: text,
            fontSize: textSize,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
class IconButtonWidget extends StatelessWidget {

  final VoidCallback onClicked;
  final IconData icon;
  final double? iconSize;
  final double width, height;
  final double radius;
  final bool loader, oneColor;


  final Color textColor, borderColor, backgroundColor;
  final bool isShadow;

  const IconButtonWidget({
    Key? key,
    required this.onClicked,
    this.iconSize,
    required this.width,
    required this.height,
    this.radius = 50.0,
    this.loader = false,
    this.oneColor = false,
    this.textColor = Colors.white,
    this.borderColor = primaryColor,
    this.backgroundColor = primaryColor,
    this.isShadow = true,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: isDarkMode ? Border.all(

              color: Colors.transparent,width: 0.0)
              :
          Border.all(width: oneColor ? 1.0 :0.0,color: oneColor ? borderColor :Colors.transparent),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              oneColor ? backgroundColor : (isDarkMode ? primaryColor : primaryColor),
              oneColor ? backgroundColor : (isDarkMode ? secondaryColor : lightPurpleColor),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: isShadow ? 2 : 0,
              blurRadius: isShadow ? 5 : 0,
              offset: Offset(isShadow ? 0 : 0, isShadow ? 3 : 0),
            ),
          ],
        ),
        child: loader
            ? const CircularProgressIndicator(
          color: AppColors.appBackgroundColor,
        )
            : Center(
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.white,
            )
        ),
      ),
    );
  }
}

