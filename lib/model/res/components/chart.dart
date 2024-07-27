import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';

import '../../../provider/theme/theme_provider.dart';

class CartesianChart extends StatefulWidget {
  final String title,time;
  const CartesianChart({super.key,  required this.title, required this.time});

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  List<_SalesData> data = [
    _SalesData('Monday', 35),
    _SalesData('Tuesday', 28),
    _SalesData('Wednesday', 34),
    _SalesData('thursday', 32),
    _SalesData('Friday', 40)
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
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
          color: _isDark ? AppColors.appYellowColor : AppColors.appWhiteColor,
          dataSource: data,
          xValueMapper: (_SalesData sales, _) => sales.year,
          yValueMapper: (_SalesData sales, _) => sales.sales,
          name: widget.time,
          dataLabelSettings: const DataLabelSettings(isVisible: true,
            textStyle: const TextStyle(color: Colors.white), // Title text color

          ),
        )
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
