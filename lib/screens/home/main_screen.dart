import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/screens/focus/focus_ScreenO.dart';

import '../../model/res/constant/app_assets.dart';
import '../../model/res/constant/app_colors.dart';
import '../../provider/theme/theme_provider.dart';
import '../menu/menu_screen.dart';
import 'instagram/instagram.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [ FocusScreenO(), const Instagram(), MenuScreen()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.logo,
              height: 30,
              color: _selectedIndex == 0 ? (_isDark ? AppColors.appYellowColor : AppColors.appRedColor) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
              color: _selectedIndex == 1 ? (_isDark ? AppColors.appYellowColor : AppColors.appRedColor) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.menu,
              height: 30,
              color: _selectedIndex == 2 ? (_isDark ? AppColors.appYellowColor : AppColors.appRedColor) : Colors.grey,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFEDE7F6),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
