import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_neumorphic_progress/material_neumorphic_progress.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

import '../../../model/res/components/chart.dart';
import '../../../provider/progress_bar/gradient_bar.dart';
import '../../../provider/progress_bar/progress_bar.dart';
import '../../../provider/theme/theme_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40)
    ];

    final progressData = context.watch<ProgressModel>().progress;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Flutter Theme Provider'),
        //   actions: [
        //     Switch(
        //       value: themeProvider.isDarkMode,
        //       onChanged: (value) {
        //         themeProvider.toggleTheme();
        //       },
        //     ),
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                 _isDark? AppAssets.instagramBgBlack:
                AppAssets.instagramBgWhite,),
              fit: BoxFit.fill
              )
              // gradient: _isDark
              //     ? const LinearGradient(colors: [Colors.black, Colors.black])
              //     : const LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [Color(0xffFF5000), Color(0xff8C90E7)],
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){Get.back();},
                            child: Icon(Icons.arrow_back_ios,
                              color: Colors.white
                              ,size: 16,),
                          ),
                           SizedBox(width: Get.width/4.2),
                          AppTextWidget(
                            text: 'APPLICATIONS',
                            fontSize: 18,
                            color: _isDark ? Colors.black : Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                            color: _isDark ? const Color(0xff363636) : Colors.white,
                          ),
                          const SizedBox(width: 40),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: _isDark ? const Color(0xff111111) : Colors.white,
                            ),
                            child: Image.asset(AppAssets.insta),
                          ),
                          const SizedBox(width: 40),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: _isDark ? const Color(0xff363636) : Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                         'Instagram',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 12,
                        ),

                      ),
                      const SizedBox(height: 20),
                      const CartesianChart(
                        title: 'Time spent on Instagram',
                        time: 'Time',
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _isDark ? Colors.black : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        AppTextWidget(
                          text:
                          'Time Saved',
                            fontSize: 14,
                            color: _isDark ? Colors.white : AppColors.appRedColor,
                            fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 10),
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: progressData.keys.map((day) {
                            final duration = progressData[day]!;
                            final hours = duration.inHours;
                            final minutes = duration.inMinutes % 60;
                            final totalMinutes = duration.inMinutes;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(

                                children: [
                                  SizedBox(
                                    width: 84,
                                    child: Text(
                                      '$day:',
                                         style: TextStyle(
                                           color: _isDark
                                               ? Colors.white
                                               : AppColors.appRedColor,
                                           fontWeight: FontWeight.w500
                                         ),
                                      textAlign: TextAlign.start,
                                      softWrap: false,
                                    ),
                                  ),
                                  Expanded(
                                    child: GradientProgressIndicator(
                                      value: totalMinutes.toDouble(), // Current minutes
                                      maxValue: totalMinutes / 240.0,
                                      minHeight: 9,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${hours}h ${minutes}min',
                                      style: TextStyle(
                                        color: _isDark
                                            ? Color(0xff333333)
                                            : AppColors.appPrimaryColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 110,
                          decoration: _isDark
                              ? BoxDecoration(
                            color:AppColors.appBarColor,
                            borderRadius: BorderRadius.circular(25),
                          )
                              : BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [Color(0xffFF5000), Color(0xff7F96FF)],
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppAssets.delete,
                                  height: 15,
                                  width: 15,
                                ),
                                SizedBox(width: 5),
                                AppTextWidget(text: 'Eliminate',
                                  color: Colors.white,
                                fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
