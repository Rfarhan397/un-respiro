import 'package:get/get.dart';
import 'package:unrespiro/model/res/routes/routes_name.dart';
import 'package:unrespiro/screens/auth/login_screen.dart';
import 'package:unrespiro/screens/splash/confirm_screen.dart';
import 'package:unrespiro/screens/splash/permission_screen.dart';
import 'package:unrespiro/screens/splash/splash_screen.dart';

import '../../../screens/focus/focus_ScreenO.dart';
import '../../../screens/home/instagram/instagram.dart';
import '../../../screens/home/main_screen.dart';
import '../../../screens/menu/matrics/metrics_Screen.dart';
import '../../../screens/menu/plans/plans_screen.dart';
import '../../../screens/menu/profile/profile_screen.dart';
import '../../../screens/update/update_screen.dart';

class Routes{
  static final routes = [
    GetPage(
        name: RoutesName.splashScreen,
        page: ()=> SplashScreen()
    ),
    GetPage(
        name: RoutesName.confirmScreen,
        page: ()=> ConfirmScreen()
    ),
    GetPage(
        name: RoutesName.loginScreen,
        page: ()=> LoginScreen()
    ),
    GetPage(
        name: RoutesName.permissionScreen,
        page: ()=> PermissionScreen()
    ),
    GetPage(
        name: RoutesName.mainScreen,
        page: ()=> MainScreen()
    ),
    GetPage(
        name: RoutesName.Instagram,
        page: ()=> Instagram()
    ),GetPage(
        name: RoutesName.Update,
        page: ()=> UpdateScreen()
    ),GetPage(
        name: RoutesName.focusScreenO,
        page: ()=> FocusScreenO()
    ),GetPage(
        name: RoutesName.planScreen,
        page: ()=> PlansScreen(),
    ),GetPage(
        name: RoutesName.profileScreen,
        page: ()=> ProfileScreen(),
    ),GetPage(
        name: RoutesName.metricsScreen,
        page: ()=> MetricsScreen(),
    ),

  ];
}