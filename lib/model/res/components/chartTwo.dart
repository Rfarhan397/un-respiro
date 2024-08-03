import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    _SalesData('Jan', 80),
    _SalesData('Feb', 40),
    _SalesData('Mar', 50),
    _SalesData('Apr', 40),
    _SalesData('May', 60),
    _SalesData('Jun', 50),
    _SalesData('Jul', 70),
    _SalesData('Aug', 41),
    _SalesData('sep', 32),
    _SalesData('Oct', 34),
    _SalesData('Nov', 25),
    _SalesData('Dec', 12),
  ];
  List<_SalesData> data2 = [
    _SalesData('Jan', 50),
    _SalesData('Feb', 70),
    _SalesData('Mar', 65),
    _SalesData('Apr', 30),
    _SalesData('May', 50),
    _SalesData('Jun', 40),
    _SalesData('Jul', 45),
    _SalesData('Aug', 31),
    _SalesData('sep', 20),
    _SalesData('Oct', 35),
    _SalesData('Nov', 23),
    _SalesData('Dec', 34),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    final yAxisFormatter = NumberFormat.compact(); // Use compact number formatting
    return SizedBox(
      height: 200,
      width: 300,
      child: SfCartesianChart(
        margin: EdgeInsets.all(10), // Adjust margin
        primaryXAxis: CategoryAxis(
          interval: 1,
          maximumLabels: 12,
          majorTickLines: MajorTickLines(color: _isDark ? Color(0xff333333) : Colors.grey.withOpacity(0.4)),
          majorGridLines: MajorGridLines(width: 1,color: Colors.grey.withOpacity(0.4)), // Remove Y-axis grid lines
          axisLine: AxisLine(
            color: Colors.grey
          ),
          labelStyle:  TextStyle(color: _isDark ? Color(0xff333333):Colors.grey), // X-axis labels
        ),
        primaryYAxis: NumericAxis(
          interval: 12,
          minimum: 30,
          maximum: 100,
          majorTickLines: MajorTickLines(color: _isDark ? Color(0xff333333) : Colors.grey.withOpacity(0.4)),
          majorGridLines: MajorGridLines(width: 1,color: Colors.grey.withOpacity(0.4)), // Remove Y-axis grid lines
          axisLine: AxisLine(
              color: Colors.grey
          ),
          labelStyle:  TextStyle(color: _isDark ? Color(0xff333333):Colors.grey),
          numberFormat: yAxisFormatter,
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
            color:  AppColors.appYellowColor ,
            width: 2, // Line width
            dataSource: data,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            dataLabelSettings: DataLabelSettings(
              isVisible: false,
              textStyle: TextStyle(
                color: _isDark ? Color(0xff333333) : Colors.black,
              ), // Data label text color
            ),),
      LineSeries<_SalesData, String>(
      color: Colors.blueAccent ,
      width: 2, // Line width
      dataSource: data2,
      xValueMapper: (_SalesData sales, _) => sales.year,
      yValueMapper: (_SalesData sales, _) => sales.sales,
      dataLabelSettings: DataLabelSettings(
      isVisible: false,
      textStyle: TextStyle(
      color: _isDark ? Color(0xff333333) : Colors.black,
      ), // Data label text color
      ),)
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
