import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/components/appbar.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

import '../../../model/res/components/chart.dart';
import '../../../provider/dropdown/dropdown_provider.dart';
import '../../../provider/matrics_progess/matrics_provider.dart';
import '../../../provider/progress_bar/gradient_bar.dart';
import '../../../provider/progress_bar/progress_bar.dart';

class MetricsScreen extends StatelessWidget {
   MetricsScreen({super.key});


   final List<String> options = ['Weekly', 'Monthly', 'Daily'];

   @override
  Widget build(BuildContext context) {
    final percentageProvider = Provider.of<MatricsPercentageProvider>(context);
    final percentage = percentageProvider.percentage;
    final progressData = context.watch<ProgressModel>().progress;
    return Scaffold(
      body: SafeArea(child: Container(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidget(text: 'Matrics'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppTextWidget(
                                text:
                                'Percentage of usage of your applications:',
                                color: Colors.white, fontSize: 16,textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              AppTextWidget(
                                text:
                                'Date of first installation:',
                                color: Colors.white, fontSize: 16,textAlign: TextAlign.start,),
                              SizedBox(height: 5),
                              Text(
                                '13/02/2020',
                                style: TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 4.0,
                            percent: percentage / 100,
                            center: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColors.appBarColor,
                                borderRadius: BorderRadius.circular(60)
                              ),
                              child: Center(
                                child: Text(
                                  "${percentage.toInt()}%",
                                  style: TextStyle(fontSize: 40.0, color: Colors.orange),
                                ),
                              ),
                            ),
                            progressColor: Colors.orange,
                            backgroundColor: Colors.grey[800]!,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    AppTextWidget(text: 'Matrics',fontWeight: FontWeight.bold,fontSize: 18,),
                    buildDropDown(),
                    CartesianChart(title: '',time: '',),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 10,),
                        AppTextWidget(
                            text: 'Time of use since the installation of Unrespiro',fontSize: 14,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.appYellowColor,
                          ),
                        ),
                        SizedBox(width: 10,),
                        AppTextWidget(text: 'Time of use before Unrespiro',fontSize: 14,)
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextWidget(text: 'Time saved',fontSize: 18,),
                        buildDropDown(),
                      ],
                    ),
                    SizedBox(height: 30,),
                    ListView(
                      shrinkWrap: true,
                      children: progressData.keys.map((day) {
                        final duration = progressData[day]!;
                        final hours = duration.inHours;
                        final minutes = duration.inMinutes % 60;
                        final totalMinutes = duration.inMinutes;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 90,
                                child: Text(
                                  '$day:',
                                  style: TextStyle(fontSize: 14,color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child:  GradientProgressIndicator(
                                  value: totalMinutes / 80.0,
                                  minHeight: 15,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text('${hours}h ${minutes}min',
                                style: TextStyle(
                                  color: Colors.grey,),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),

                  ],
                ),
              ),
          
            ],
          ),
        ),
      )),
    );
  }

   Consumer<DropdownProvider> buildDropDown() {
     return Consumer<DropdownProvider>(
                  builder: (context, dropdownProvider, child) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: Get.width/3,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.orange),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(

                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.black,
                                    alignment: Alignment.centerRight,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: options.map((option) {
                                        return RadioListTile<String>(
                                          title: Text(
                                            option,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          value: option,
                                          groupValue: dropdownProvider.selectedOption,
                                          activeColor: Colors.orange,
                                          onChanged: (value) {
                                            if (value != null) {
                                              dropdownProvider.setSelectedOption(value);
                                              Navigator.of(context).pop();
                                            }
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dropdownProvider.selectedOption,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.orange,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
   }
}
