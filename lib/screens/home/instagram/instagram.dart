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

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   surfaceTintColor: Colors.transparent,
      //
      //   title: AppTextWidget(text: 'APPLICATIONS',color: Colors.white,fontSize: 14,),
      //   leading:  Icon(
      //     Icons.arrow_back_ios,
      //     size: 18,
      //     color: _isDark ? const Color(0xff363636) : Colors.white,
      //   ),
      //
      //   centerTitle: true,
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
                  _isDark
                      ? AppAssets.instagramBgBlack
                      : AppAssets.instagramBgWhite,
                ),
                fit: BoxFit.fill),
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
              //SizedBox(height: Get.height*0.05,),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 10, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        SizedBox(width: Get.width / 4.1),
                        AppTextWidget(
                          text: 'APPLICATIONS',
                          fontSize: 16,
                          color: _isDark ? Colors.black : Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color:
                              _isDark ? const Color(0xff363636) : Colors.white,
                        ),
                        const SizedBox(width: 40),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: _isDark
                                ? const Color(0xff111111)
                                : Colors.white,
                          ),
                          child: Image.asset(AppAssets.insta),
                        ),
                        const SizedBox(width: 40),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color:
                              _isDark ? const Color(0xff363636) : Colors.white,
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
                    const SizedBox(height: 15),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      AppTextWidget(
                        text: 'Time Saved',
                        fontSize: 14,
                        color: _isDark ? Colors.white : AppColors.appRedColor,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 10),
                      buildRow(_isDark, 'Monday:', '30min.'),
                      buildRow(_isDark, 'Tuesday:', '45min.'),
                      buildRow(_isDark, 'Wednesday:', '27min.'),
                      buildRow(_isDark, 'Thursday:', '1hr 10min.'),
                      buildRow(_isDark, 'Friday:', '1hr 30min.'),
                      buildRow(_isDark, 'Saturday:', '40min.'),
                      buildRow(_isDark, 'Sunday:', '10min.'),
                      // ListView(
                      //   shrinkWrap: true,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   children: progressData.keys.map((day) {
                      //     final duration = progressData[day]!;
                      //     final hours = duration.inHours;
                      //     final minutes = duration.inMinutes % 60;
                      //     final totalMinutes = duration.inMinutes;
                      //
                      //     return Padding(
                      //       padding: const EdgeInsets.symmetric(vertical: 4.0),
                      //       child: Row(
                      //
                      //         children: [
                      //           SizedBox(
                      //             width: 84,
                      //             child: Text(
                      //               '$day:',
                      //                  style: TextStyle(
                      //                    color: _isDark
                      //                        ? Colors.white
                      //                        : AppColors.appRedColor,
                      //                    fontWeight: FontWeight.w500
                      //                  ),
                      //               textAlign: TextAlign.start,
                      //               softWrap: false,
                      //             ),
                      //           ),
                      //           Expanded(
                      //             child: GradientProgressIndicator(
                      //               value: totalMinutes.toDouble(), // Current minutes
                      //               maxValue: totalMinutes / 240.0,
                      //               minHeight: 9,
                      //             ),
                      //           ),
                      //           const SizedBox(width: 10),
                      //           Text(
                      //             '${hours}h ${minutes}min',
                      //               style: TextStyle(
                      //                 color: _isDark
                      //                     ? Color(0xff333333)
                      //                     : AppColors.appPrimaryColor,
                      //                 fontWeight: FontWeight.w400,
                      //                 fontSize: 12,
                      //               ),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   }).toList(),
                      // ),
                      const SizedBox(height: 20),
                      Container(
                        width: 80,
                        decoration: _isDark
                            ? BoxDecoration(
                                color: AppColors.appBarColor,
                                borderRadius: BorderRadius.circular(25),
                              )
                            : BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.0, 1.0],
                                  colors: [
                                    Color(0xffFF5000),
                                    Color(0xff7F96FF)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.delete,
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(width: 5),
                              AppTextWidget(
                                text: 'Eliminate',
                                fontSize: 10,
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
    );
  }

  Widget buildRow(bool _isDark, day, time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 40),
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
                  color: _isDark ? Colors.white : AppColors.appRedColor,
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
                color: _isDark
                    ? Colors.white
                    : AppColors.appRedColor.withOpacity(0.8),
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

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
