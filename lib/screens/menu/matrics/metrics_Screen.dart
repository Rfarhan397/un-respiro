import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/components/appbar.dart';
import 'package:unrespiro/model/res/components/chartTwo.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';
import 'package:unrespiro/model/res/widgets/customRadio.dart';

import '../../../model/res/components/appbarSimple.dart';
import '../../../model/res/components/chart.dart';
import '../../../model/res/widgets/circularpercentindicator.dart';
import '../../../provider/dropdown/dropdown_provider.dart';
import '../../../provider/matrics_progess/matrics_provider.dart';
import '../../../provider/progress_bar/gradient_bar.dart';
import '../../../provider/progress_bar/progress_bar.dart';
import '../../../provider/theme/theme_provider.dart';

class MetricsScreen extends StatelessWidget {
   MetricsScreen({super.key});


   final List<String> options = ['Weekly', 'Monthly', 'Daily'];

   @override
  Widget build(BuildContext context) {
    final percentageProvider = Provider.of<MatricsPercentageProvider>(context);
    final percentage = percentageProvider.percentage;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    final progressData = context.watch<ProgressModel>().progress;
    return Scaffold(
      body: Container(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AppBar(
              //   actions: [
              //     Switch(
              //       value: themeProvider.isDarkMode,
              //       onChanged: (value) {
              //         themeProvider.toggleTheme();
              //       },
              //     ),
              //   ],
              // ),
              AppbarSimpleWidget(
                text: 'MATRICS',
                fontSize: 16,
                textColor: _isDark ? Colors.white:Colors.black,
                color: _isDark ? AppColors.appBarColor:AppColors.appDarkPurpleColor,
                secondColorGradient: _isDark ? AppColors.appBarColor:AppColors.appDarkPurpleColor,
                icon: Icons.arrow_back_ios,onTap: (){
                Get.back();
              },),
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
                                fontWeight: FontWeight.w500,
                                color: _isDark ? Colors.white : AppColors.appRedColor,
                                fontSize: 12,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              AppTextWidget(
                                text:
                                'Date of first installation:',
                                fontWeight: FontWeight.w500,
                                color: _isDark ? Colors.black:Colors.black,
                                fontSize: 12,textAlign: TextAlign.start,),
                              SizedBox(height: 5),
                              AppTextWidget(
                                text:
                                '13/02/2020',
                                color:  Colors.grey,
                                  fontSize: 12),
                            ],
                          ),
                        ),
                        CircularIndicatorWithEndCircle(percentage: 80,)

                      ],
                    ),
                    SizedBox(height: 40,),
                    AppTextWidget(text: 'Matrics',
                      color: _isDark ? Colors.white: AppColors.appRedColor,
                      fontWeight: FontWeight.w500,fontSize: 14,),
                    buildDropDown(context),
                    CartesianChartTwo(title: '',time: '',),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                              'Time of use since the installation of Unrespiro',
                              style:
                              TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.appYellowColor,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                             'Time of use before Unrespiro',
                            style:
                            TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                            )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextWidget(text: 'Time saved',
                          color: _isDark ? Colors.white: AppColors.appRedColor,
                          fontSize: 14,fontWeight: FontWeight.w500,),
                        buildDropDown(context),
                      ],
                    ),
                    SizedBox(height: 30,),
                    buildRow(_isDark, 'Monday:', '30min.'),
                    buildRow(_isDark, 'Tuesday:', '45min.'),
                    buildRow(_isDark, 'Wednesday:', '27min.'),
                    buildRow(_isDark, 'Thursday:', '1hr 10min.'),
                    buildRow(_isDark, 'Friday:', '1hr 30min.'),
                    buildRow(_isDark, 'Saturday:', '40min.'),
                    buildRow(_isDark, 'Sunday:', '10min.'),
                    // ListView(
                    //   shrinkWrap: true,
                    //   children: progressData.keys.map((day) {
                    //     final duration = progressData[day]!;
                    //     final hours = duration.inHours;
                    //     final minutes = duration.inMinutes % 60;
                    //     final totalMinutes = duration.inMinutes;
                    //
                    //     return Padding(
                    //       padding: const EdgeInsets.symmetric(vertical: 8.0),
                    //       child: Row(
                    //         children: [
                    //           SizedBox(
                    //             width: 90,
                    //             child: Text(
                    //               '$day:',
                    //               style: TextStyle(fontSize: 14,color: _isDark ? Colors.white: Colors.black,),
                    //             ),
                    //           ),
                    //           Expanded(
                    //             child:  GradientProgressIndicator(
                    //               value: totalMinutes / 80.0,
                    //               minHeight: 12,
                    //             ),
                    //           ),
                    //           SizedBox(width: 10),
                    //           Text('${hours}h ${minutes}min',
                    //             style: TextStyle(
                    //               color: _isDark ? Colors.grey: Colors.black.withOpacity(0.8),),
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

   // Consumer<DropdownProvider> buildDropDown(context) {
   //   final themeProvider = Provider.of<ThemeProvider>(context);
   //   final _isDark = themeProvider.isDarkMode;
   //   return Consumer<DropdownProvider>(
   //                builder: (context, dropdownProvider, child) {
   //                  return Align(
   //                    alignment: Alignment.centerRight,
   //                    child: Container(
   //                      width: Get.width/2.8,
   //                      height: 30,
   //                      //padding: EdgeInsets.all(10),
   //                      decoration: BoxDecoration(
   //                        color: _isDark ? AppColors.appBarColor:AppColors.appDarkPurpleColor,
   //                        borderRadius: BorderRadius.circular(40),
   //                        border: Border.all(color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor),
   //                      ),
   //                      child: Column(
   //                        mainAxisSize: MainAxisSize.min,
   //                        children: [
   //                          GestureDetector(
   //                            onTap: () {
   //                              // showDialog(
   //                              //   context: context,
   //                              //   builder: (context) => AlertDialog(
   //                              //     backgroundColor: _isDark ? AppColors.appBarColor:AppColors.appDarkPurpleColor,
   //                              //     alignment: Alignment.centerRight,
   //                              //     content: Column(
   //                              //       mainAxisSize: MainAxisSize.min,
   //                              //       children: options.map((option) {
   //                              //         return RadioListTile<String>(
   //                              //           title: Text(
   //                              //             option,
   //                              //             style: TextStyle(color: _isDark ? Colors.black:Colors.white),
   //                              //           ),
   //                              //           value: option,
   //                              //           groupValue: dropdownProvider.selectedOption,
   //                              //           activeColor: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
   //                              //           onChanged: (value) {
   //                              //             if (value != null) {
   //                              //               dropdownProvider.setSelectedOption(value);
   //                              //               Navigator.of(context).pop();
   //                              //             }
   //                              //           },
   //                              //         );
   //                              //       }).toList(),
   //                              //     ),
   //                              //   ),
   //                              // );
   //                            },
   //                            child: Row(
   //                              mainAxisAlignment: MainAxisAlignment.spaceAround,
   //                              children: [
   //                                AppTextWidget(
   //                                  text:
   //                                  dropdownProvider.selectedOption,
   //                                 color: _isDark ? Colors.white:Colors.black),
   //                                Icon(
   //                                  Icons.keyboard_arrow_down_rounded,
   //                                  color: Colors.orange,
   //                                ),
   //                              ],
   //                            ),
   //                          ),
   //                        ],
   //                      ),
   //                    ),
   //                  );
   //                },
   //              );
   // }
   Consumer<DropdownProvider> buildDropDown(context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
     final _isDark = themeProvider.isDarkMode;
     return Consumer<DropdownProvider>(
       builder: (context, dropdownProvider, child) {
         return Align(
           alignment: Alignment.centerRight,
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Container(
                 width: Get.width / 2.8,
                // height: 30,
                 decoration: BoxDecoration(
                   color: _isDark ? AppColors.appBarColor : AppColors.appDarkPurpleColor,
                   borderRadius: BorderRadius.circular(10),
                   //border: Border.all(color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor),
                 border: Border(
                   top: BorderSide(
                     color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                     width: 1.0,
                   ),
                   right: BorderSide(
                     color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                     width: 1.0,
                   ),
                   bottom: BorderSide(
                     color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                     width: 1.0,
                   ),
                   left: BorderSide(
                     color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                     width: 1.0,
                   ),
                 )
                 ),
                 child: GestureDetector(
                   onTap: () {
                     dropdownProvider.toggleDropdownVisibility();
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       AppTextWidget(
                         text: dropdownProvider.selectedOption,
                         color: _isDark ? Colors.white : Colors.black,
                       ),
                       Icon(
                         Icons.keyboard_arrow_down_rounded,
                         color: _isDark ? AppColors.appYellowColor: AppColors.appRedColor,
                       ),
                     ],
                   ),
                 ),
               ),
               Visibility(
                 visible: dropdownProvider.isDropdownVisible,
                 child: Container(
                   width: Get.width / 2.8,
                   decoration: BoxDecoration(
                     color: _isDark ? AppColors.appBarColor : AppColors.appDarkPurpleColor,
                     borderRadius: BorderRadius.only(
                         bottomRight: Radius.circular(10)
                         ,bottomLeft: Radius.circular(10)),
                    // border: Border.all(color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor),
                  border: Border(
                    top: BorderSide.none,
                    right: BorderSide(
                      color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                      width: 1.0,
                    ),
                  )
                   ),
                   child: Column(
                     //mainAxisSize: MainAxisSize.min,
                     children: options.map((option) {
                       return CustomRadioItem(
                           option: option,
                           groupValue: dropdownProvider.selectedOption,
                           isDark: _isDark , onChanged:(value) {
                         if (value != null) {
                           dropdownProvider.setSelectedOption(value);
                           dropdownProvider.toggleDropdownVisibility();
                         }
                       },);
                     }).toList(),
                   ),
                 ),
               ),
             ],
           ),
         );
       },
     );
   }
   Widget buildRow(bool _isDark, day, time) {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Expanded(
             flex: 1,
             child: Text(
               day,
               style: TextStyle(
                   fontSize: 12,
                   color: _isDark ? Colors.white: Colors.black,
                   fontWeight: FontWeight.w500),
               textAlign: TextAlign.start,
               softWrap: false,
             ),
           ),
           SizedBox(
             width: 5,
           ),
           Expanded(
             flex: 2,
             child: Container(
               width: 100,
               child: GradientProgressIndicator(
                 value: 20, // Current minutes
                 maxValue: 20 / 240.0,
                 minHeight: 8,
               ),
             ),
           ),
           SizedBox(
             width: 10,
           ),
           Expanded(
             flex: 1,
             child: Text(
               time,
               style: TextStyle(
                 fontSize: 12,
                 color: _isDark ? Colors.grey: Colors.black.withOpacity(0.8),
               ),
               textAlign: TextAlign.start,
               softWrap: false,
             ),
           ),
         ],
       ),
     );
   }

}
