import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/components/appbar.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';
import 'package:unrespiro/model/res/widgets/button_widget.dart';
import 'package:unrespiro/provider/theme/theme_provider.dart';

import '../../../model/res/components/appbarSimple.dart';
import '../../../provider/plan/plan_provider.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planProvider = Provider.of<PlanProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    final selectedPlan = planProvider.selectedPlan;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarSimpleWidget(
                text: 'PLANS',
                fontSize: 16,
                icon: Icons.arrow_back_ios,
                onTap: (){Get.back();},
                textColor: Colors.black,
                secondColorGradient: _isDark ?AppColors.appBarColor:AppColors.appDarkPurpleColor,
                color: _isDark
                    ? AppColors.appBarColor
                    : AppColors.appDarkPurpleColor,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: Get.height / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _isDark
                        ? AppColors.appBarColor
                        : AppColors.appDarkPurpleColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 38.0),
                        child: Column(
                          children: [
                            AppTextWidget(
                              text: 'Free',
                              color: _isDark
                                  ? AppColors.appBarColor
                                  : AppColors.appRedColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 20),
                            buildFreePaid(Icons.check, Colors.green,
                                'breathing exercise'),
                            buildFreePaid(
                                Icons.check, Colors.green, 'Unlimited Apps'),
                            buildFreePaid(
                                Icons.close, Colors.red, 'Lorem ispum'),
                            buildFreePaid(
                                Icons.close, Colors.red, 'Lorem ispum'),
                            buildFreePaid(
                                Icons.close, Colors.red, 'Lorem ispum'),
                          ],
                        ),
                      )),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 40),
                        width: 1,
                        height: Get.height,
                        color: Colors.grey,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 38.0),
                        child: Column(
                          children: [
                            AppTextWidget(
                              text: 'Paid',
                              fontSize: 18,
                              color: _isDark
                                  ? AppColors.appBarColor
                                  : AppColors.appRedColor,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 20),
                            buildFreePaid(Icons.check, Colors.green,
                                'breathing exercise'),
                            buildFreePaid(
                                Icons.check, Colors.green, 'Unlimited Apps'),
                            buildFreePaid(
                                Icons.close, Colors.red, 'Lorem ispum'),
                            buildFreePaid(
                                Icons.close, Colors.red, 'Lorem ispum'),
                            buildFreePaid(
                                Icons.close, Colors.red, 'Lorem ispum'),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
                child: Row(
                  children: [
                    _buildPlanContainer(
                      context,
                      planProvider,
                      selectedPlan,
                      1,
                      'Monthly Plan',
                      '\$00.00',
                      'Per month',
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    _buildPlanContainer(
                      context,
                      planProvider,
                      selectedPlan,
                      2,
                      'Yearly Plan',
                      '\$00.00',
                      'Per year',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ButtonWidget(
                  text: 'Select', onClicked: () {}, width: 150, height: 40),
              SizedBox(height: 50,),
            ],
          ),
        )));
  }

  Padding buildFreePaid(IconData icon, var color, String text) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            AppTextWidget(
              text: text,
              fontSize: 12,
            ),
          ],
        ),
      );

  Widget _buildPlanContainer(
    BuildContext context,
    PlanProvider planProvider,
    int selectedPlan,
    int planValue,
    String title,
    String price,
    String duration,
  ) {
    final isSelected = selectedPlan == planValue;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;

    return Expanded(
      child: GestureDetector(
        onTap: () => planProvider.selectPlan(planValue),
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          height: 110,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _isDark ? AppColors.appBarColor : AppColors.appDarkPurpleColor,
            border: Border.all(
              color: isSelected ? _isDark ? AppColors.appYellowColor:AppColors.appRedColor :  Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0,right: 8.0,bottom: 8.0),
                child: CustomRadio(isSelected, _isDark),
              ),
      
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Radio(
              //     value: planValue,
              //     groupValue: selectedPlan,
              //     activeColor: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,
              //     onChanged: (int? value) {
              //       if (value != null) {
              //         planProvider.selectPlan(value);
              //       }
              //     },
              //   ),
              // ),
              AppTextWidget(text: title,fontSize: 12),
              AppTextWidget(text: price,fontSize: 14,),
              AppTextWidget(text: duration,fontSize: 10,),
            ],
          ),
        ),
      ),
    );
  }

  Align CustomRadio(bool isSelected, bool _isDark) {
    return Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? (_isDark ? AppColors.appYellowColor:AppColors.appRedColor)
                      : _isDark? AppColors.appYellowColor:AppColors.appRedColor,
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
                    color: _isDark ? AppColors.appYellowColor:AppColors.appRedColor,
                  ),
                ),
              )
                  : null,
            ),
          );
  }
}
