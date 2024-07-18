import 'package:get/get.dart';
import 'package:unrespiro/model/res/routes/routes_name.dart';
import 'package:unrespiro/screens/auth/login_screen.dart';
import 'package:unrespiro/screens/splash/confirm_screen.dart';
import 'package:unrespiro/screens/splash/splash_screen.dart';

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

  ];
}