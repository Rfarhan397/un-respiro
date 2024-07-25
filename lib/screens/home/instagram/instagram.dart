import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_neumorphic_progress/material_neumorphic_progress.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';

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
      appBar: AppBar(
        title: Text('Applications'),
        actions: [
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: _isDark
                ? LinearGradient(colors: [
                    Colors.black,
                    Colors.black,
                  ])
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        Color(0xffFF5000),
                        Color(0xff8C90E7),
                      ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: _isDark ? Color(0xff363636) : Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: _isDark ? Color(0xff111111) : Colors.white,
                          ),
                          child: Image.asset(AppAssets.insta),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: _isDark ? Color(0xff363636) : Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Instagram',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CartesianChart(title: 'Time spent on Instagram',time: 'Time',)
                  ],
                ),
              ),
            ),
            //const SizedBox(height: 20),
            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      color: _isDark ?  Colors.black : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Text(
                            'Time Saved',
                            style: TextStyle(
                                color: _isDark
                                    ? Colors.white
                                    : AppColors.appRedColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                                        style: TextStyle(fontSize: 14,
                                            color: _isDark ?  Colors.white:AppColors.appRedColor,),
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
                                      color: _isDark ?  Colors.grey:AppColors.appPrimaryColor,),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 120,
                            decoration: _isDark
                                ? BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25))
                                : BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: [0.0, 1.0],
                                      colors: [
                                        Color(0xffFF5000),
                                        Color(0xff7F96FF),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_forever_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Eliminate',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
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
