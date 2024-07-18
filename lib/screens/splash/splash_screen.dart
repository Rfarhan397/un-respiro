import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/components/mode_appbar.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

import '../../model/res/components/radical_gradient_background.dart';
import '../../model/res/routes/routes_name.dart';
import '../../provider/theme/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    Future.delayed(Duration(seconds: 4), () {
      Get.offNamed(RoutesName.confirmScreen);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isDark = ThemeProvider.isDark;
    return Scaffold(
      body: RadialGradientBackground(
        isDarkMode: _isDark,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppTextWidget(
                text: "Un Respiro",
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
             const SizedBox(height: 20.0,),
              RotationTransition(
                turns: _controller,
                child: Image.asset(_isDark ? AppAssets.logoImage : AppAssets.lightLogoImage), // Your image asset
              ),
            ],
          ),
        ),
        ),
    );
  }
}
