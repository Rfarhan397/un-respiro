import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/provider/actions/action_provider.dart';
import 'package:unrespiro/provider/chronometer_provider/chronometer_provider.dart';
import 'package:unrespiro/provider/dropdown/dropdown_provider.dart';
import 'package:unrespiro/provider/matrics_progess/matrics_provider.dart';
import 'package:unrespiro/provider/plan/plan_provider.dart';
import 'package:unrespiro/provider/progress_bar/progress_bar.dart';
import 'package:unrespiro/provider/theme/theme_provider.dart';
import 'package:unrespiro/provider/timer_provider/timer_provider.dart';
import 'package:unrespiro/provider/toggle/toggle_provider.dart';

import 'model/res/routes/routes.dart';
import 'model/res/routes/routes_name.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeProvider().loadThemeMode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ActionProvider()),
        ChangeNotifierProvider(create: (_) => ProgressModel()),
        ChangeNotifierProvider(create: (_) => ToggleModel()),
        ChangeNotifierProvider(create: (_) => PlanProvider()),
        ChangeNotifierProvider(create: (_) => MatricsPercentageProvider()),
        ChangeNotifierProvider(create: (_) => DropdownProvider()),
        //ChangeNotifierProvider(create: (_) => CronometerProvider()),
       // ChangeNotifierProvider(create: (_) => TimerProvider()),
      ],
      child: Consumer<ThemeProvider>(
       builder: (context,provider,child){
         return GetMaterialApp(
           debugShowCheckedModeBanner: false,
           title: 'Un Respiro',
           themeMode: provider.themeMode,
           theme: ThemeData(
             primaryColor: primaryColor,
             useMaterial3: true,
             colorScheme: const ColorScheme.light(
               primary: primaryColor,
             ),
           ),
           darkTheme: ThemeData(
             primaryColor: primaryColor,
             useMaterial3: true,
             scaffoldBackgroundColor: Colors.black,
             colorScheme: const ColorScheme.dark(
               primary: primaryColor,
               surface: Colors.black
             ),
           ),
           initialRoute: RoutesName.splashScreen,
           getPages: Routes.routes,
         );
       },
      ),
    );
  }
}

