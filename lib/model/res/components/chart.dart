import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';

import '../../../provider/theme/theme_provider.dart';

class CartesianChart extends StatefulWidget {
  final String title, time;
  const CartesianChart({super.key, required this.title, required this.time});

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  List<_SalesData> data = [
    _SalesData('Mon.', 20),
    _SalesData('Tues.', 10),
    _SalesData('Wedn.', 15),
    _SalesData('Thurs.', 7),
    _SalesData('Fri.', 30),
    _SalesData('Sat.', 15),
    _SalesData('Sun.', 45),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return SizedBox(
      height: 250,
      width: Get.width/1,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(
              width: 1, color: _isDark ? Color(0xff333333) : Colors.white),
          majorTickLines: MajorTickLines(color: _isDark ? Color(0xff333333) : Colors.white),
          labelStyle: TextStyle(color: _isDark ? Color(0xff333333) : Colors.white),
          // X-axis labels
        ),
        primaryYAxis: NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 1, color: _isDark ? Color(0xff333333) : Colors.white),
          majorTickLines: MajorTickLines(color: _isDark ? Color(0xff333333) : Colors.white),
          labelStyle: TextStyle(color: _isDark ? Color(0xff333333) : Colors.white),
            numberFormat: NumberFormat('##0')// Y-axis labels
        ),
        plotAreaBackgroundColor: Colors.transparent,
        plotAreaBorderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        title: ChartTitle(
          text: widget.title,
          textStyle: GoogleFonts.nunitoSans(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        legend: const Legend(isVisible: false),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          textStyle: TextStyle(color: _isDark ? Color(0xff333333) : Colors.white), // Tooltip text color
        ),
        series: <CartesianSeries<dynamic, dynamic>>[
          SplineSeries<_SalesData, String>(
            color: _isDark ? AppColors.appYellowColor : Colors.white,
            width: 2, // Line width
            dataSource: data,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            dataLabelSettings: DataLabelSettings(
              isVisible: false,
              textStyle: TextStyle(color: _isDark ? Color(0xff333333) : Colors.white), // Data label text color
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
