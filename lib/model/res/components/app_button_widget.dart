import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../widgets/app_text.dart.dart';

class AppButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor, textColor;
  final double? radius, fontSize;
  final bool loader;

  const AppButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonColor,
    this.radius,
    this.loader = false,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: buttonColor,
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      ),
      onPressed: onPressed,
      child: (loader)
          ? const CircularProgressIndicator(
              color: AppColors.appBackgroundColor,
            )
          : AppTextWidget(
              text: text,
              fontSize: fontSize ?? 14,
              fontWeight: FontWeight.w500,
              color: textColor ?? AppColors.appWhiteColor,
            ),
    );
  }
}
