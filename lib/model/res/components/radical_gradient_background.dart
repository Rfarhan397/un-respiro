import 'package:flutter/material.dart';
import 'package:unrespiro/constant.dart';

class RadialGradientBackground extends StatelessWidget {
  final bool isDarkMode;
  final Widget child;

  const RadialGradientBackground({
    required this.isDarkMode,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // center: Alignment.center,
          // radius: 1.5,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors: isDarkMode
              ? [Colors.black, Colors.black] // Dark mode colors
              : [
                Color(0xf5dbb7a7),
            Color(0xF3EFEEF5),], // Light mode colors
          stops: [0.0, 0.7],
        ),
      ),
      child: child,
    );
  }
}
