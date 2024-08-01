import 'package:flutter/material.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

import '../constant/app_colors.dart';

class CustomRadioItem extends StatelessWidget {
  final String option;
  final String groupValue;
  final bool isDark;
  final ValueChanged<String?> onChanged;

  const CustomRadioItem({
    required this.option,
    required this.groupValue,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = option == groupValue;

    return GestureDetector(
      onTap: () => onChanged(option),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextWidget(
              text:
              option,
              color: isDark ? Colors.white : Colors.black,),
            SizedBox(width: 8),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? (isDark ? AppColors.appYellowColor:AppColors.appRedColor)
                      : isDark? AppColors.appYellowColor:AppColors.appRedColor,
                  width: 1,
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark ? AppColors.appYellowColor:AppColors.appRedColor,
                  ),
                ),
              )
                  : null,
            ),

          ],
        ),
      ),
    );
  }
}