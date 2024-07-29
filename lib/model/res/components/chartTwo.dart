import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';

import '../../../provider/theme/theme_provider.dart';

class CartesianChartTwo extends StatefulWidget {
  final String title,time;
  const CartesianChartTwo({super.key,  required this.title, required this.time});

  @override
  State<CartesianChartTwo> createState() => _CartesianChartTwoState();
}

class _CartesianChartTwoState extends State<CartesianChartTwo> {
  List<_SalesData> data = [
    _SalesData('Jan', 0),
    _SalesData('Jan', 35),
    _SalesData('Feb', 40),
    _SalesData('Feb', 19),
    _SalesData('Mar', 32),
    _SalesData('Apr', 17),
    _SalesData('May', 24),
    _SalesData('Jun', 19),
    _SalesData('Jul', 49),
    _SalesData('Aug', 41),
    _SalesData('sep', 32),
    _SalesData('Oct', 34),
    _SalesData('Nov', 25),
    _SalesData('Dec', 12),
  ];
  List<_SalesData> data2 = [
    _SalesData('Jan', 0),
    _SalesData('Feb', 30),
    _SalesData('Feb', 37 ),
    _SalesData('Mar', 15),
    _SalesData('Apr', 7),
    _SalesData('May', 30),
    _SalesData('Jun', 15),
    _SalesData('Jul', 45),
    _SalesData('Aug', 40),
    _SalesData('sep', 30),
    _SalesData('Oct', 35),
    _SalesData('Nov', 23),
    _SalesData('Dec', 34),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        interval: 1,
        maximumLabels: 12,
        labelStyle:  TextStyle(color: _isDark ? Color(0xff333333):Colors.white), // X-axis labels
      ),
      primaryYAxis: NumericAxis(
        labelStyle:  TextStyle(color: _isDark ? Color(0xff333333):Colors.white), // Y-axis labels
      ),
      title: ChartTitle(text: widget.title ?? "",
        textStyle:  TextStyle(color: _isDark ? Color(0xff333333):Colors.white,fontSize: 12), // Title text color
      ),
      legend: const Legend(isVisible: false,
        textStyle: const TextStyle(color: Colors.transparent), // Title text color
      ),
      tooltipBehavior: TooltipBehavior(enable: true,
        textStyle:  TextStyle(color: _isDark ? Color(0xff333333):Colors.white), // Title text color
      ),
      series: <CartesianSeries<dynamic, dynamic>>[
        LineSeries<_SalesData, String>(
          color: _isDark ? AppColors.appYellowColor : Colors.white,
          width: 2, // Line width
          dataSource: data,
          xValueMapper: (_SalesData sales, _) => sales.year,
          yValueMapper: (_SalesData sales, _) => sales.sales,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(
              color: _isDark ? Color(0xff333333) : Colors.white,
            ), // Data label text color
          ),),

    LineSeries<_SalesData, String>(
    color: _isDark ? Colors.blueAccent : Colors.white,
    width: 2, // Line width
    dataSource: data2,
    xValueMapper: (_SalesData sales, _) => sales.year,
    yValueMapper: (_SalesData sales, _) => sales.sales,
    dataLabelSettings: DataLabelSettings(
    isVisible: true,
    textStyle: TextStyle(
    color: _isDark ? Color(0xff333333) : Colors.white,
    ), // Data label text color
    ),)
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
