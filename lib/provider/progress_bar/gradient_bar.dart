import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientProgressIndicator extends StatelessWidget {
  final double value;
  final double minHeight;
  final double maxValue;

  const GradientProgressIndicator({
    Key? key,
    required this.value,
    required this.minHeight,
    this.maxValue = 240.0, // Default maxValue if not provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: minHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.shade300, // Grey background for the remaining part
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          //widthFactor: (value / maxValue).clamp(0.0, 1.0), // Ensure value is between 0 and 1
          child: Container(
            height: minHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.red],
              ),
            ),
          ),
        ),
      ],
    );
  }
}