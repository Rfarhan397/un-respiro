import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/components/appbar.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';
import 'package:unrespiro/model/res/widgets/button_widget.dart';

import '../../../provider/plan/plan_provider.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planProvider = Provider.of<PlanProvider>(context);
    final selectedPlan = planProvider.selectedPlan;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    children: [
            AppbarWidget(text: 'Plans',),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: Get.height/2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.appBarColor,
                ),
                child: Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 38.0),
                      child: Column(children: [
                        AppTextWidget(text: 'Free',fontSize: 18,fontWeight: FontWeight.bold,),
                        SizedBox(height: 20),
                        buildFreePaid(Icons.check,Colors.green,'breathing exercise'),
                        buildFreePaid(Icons.check,Colors.green,'Unlimited Apps'),
                        buildFreePaid(Icons.close,Colors.red,'Lorem ispum'),
                        buildFreePaid(Icons.close,Colors.red,'Lorem ispum'),
                        buildFreePaid(Icons.close,Colors.red,'Lorem ispum'),
                      ],),
                    )),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 40),
                      width: 1,
                      height: Get.height,
                      color: Colors.grey,
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 38.0),
                      child: Column(children: [
                        AppTextWidget(text: 'Paid',fontSize: 18,fontWeight: FontWeight.bold,),
                        SizedBox(height: 20),
                        buildFreePaid(Icons.check,Colors.green,'breathing exercise'),
                        buildFreePaid(Icons.check,Colors.green,'Unlimited Apps'),
                        buildFreePaid(Icons.close,Colors.red,'Lorem ispum'),
                        buildFreePaid(Icons.close,Colors.red,'Lorem ispum'),
                        buildFreePaid(Icons.close,Colors.red,'Lorem ispum'),
                      ],),
                    )),
                  ],
                ),
              ),

            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 40),
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
                            // Container(
                            //   height: Get.height/7,
                            //   width: Get.width/3,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: AppColors.appBarColor,
                            //   ),
                            //   child: Column(
                            //     children: [
                            //       Align(
                            //         alignment: Alignment.centerRight,
                            //         child: Radio.adaptive(value: 1,
                            //             groupValue: site,
                            //             activeColor: AppColors.appYellowColor,
                            //             onChanged: (site){}),
                            //       ),
                            //       AppTextWidget(text: 'Monthly Plan'),
                            //       AppTextWidget(text: "\$00.00"),
                            //       AppTextWidget(text: "Per month"),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(width: 30,),
                            _buildPlanContainer(
                              context,
                              planProvider,
                              selectedPlan,
                              2,
                              'Yearly Plan',
                              '\$00.00',
                              'Per year',
                            ),
                            // Container(
                            //   height: Get.height/7,
                            //   width: Get.width/3,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: AppColors.appBarColor,
                            //   ),
                            //   child: Column(
                            //     children: [
                            //       Align(
                            //         alignment: Alignment.centerRight,
                            //         child: Radio.adaptive(value: 1,
                            //             groupValue: site,
                            //
                            //             activeColor: AppColors.appYellowColor,
                            //             onChanged: (site){}),
                            //       ),
                            //       AppTextWidget(text: 'Yearly Plan'),
                            //       AppTextWidget(text: "\$00.00"),
                            //       AppTextWidget(text: "Per year"),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      ButtonWidget(text: 'Select', onClicked: (){},
                          width: 120, height: 40)
                    ],
                  ),
          ))
    );
  }

  Padding buildFreePaid( IconData icon,var color,String text) =>
      Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(children: [
      Icon(icon,color: color,),
      SizedBox(width: 10,),
      AppTextWidget(text: text,
        fontSize: 14,),],),);
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

    return GestureDetector(
      onTap: () => planProvider.selectPlan(planValue),
      child: Container(
        height: Get.height / 7,
        width: Get.width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.appBarColor,
          border: Border.all(
            color: isSelected ? AppColors.appYellowColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Radio(
                value: planValue,
                groupValue: selectedPlan,
                activeColor: AppColors.appYellowColor,
                onChanged: (int? value) {
                  if (value != null) {
                    planProvider.selectPlan(value);
                  }
                },
              ),
            ),
            AppTextWidget(text: title),
            AppTextWidget(text: price),
            AppTextWidget(text: duration),
          ],
        ),
      ),
    );
  }
}
