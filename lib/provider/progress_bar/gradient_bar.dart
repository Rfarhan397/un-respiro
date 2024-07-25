import 'package:flutter/material.dart';

class GradientProgressIndicator extends StatelessWidget {
  final double value;
  final double minHeight;

  const GradientProgressIndicator({
    required this.value,
    this.minHeight = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: minHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.red, Colors.purple],
          stops: [0.0, 0.5, 1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(minHeight / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(minHeight / 2),
          ),
        ),
      ),
    );
  }
}
