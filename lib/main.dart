import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/constant.dart';
import 'package:unrespiro/provider/theme/theme_provider.dart';

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

