import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/routes/routes_name.dart';
import 'package:unrespiro/provider/actions/action_provider.dart';

import '../../model/res/components/custom_alertbox_scrollable.dart';
import '../../model/res/constant/app_assets.dart';
import '../../model/res/constant/app_string.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../model/res/widgets/button_widget.dart';
import '../../provider/theme/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          onPressed: () {
           Provider.of<ActionProvider>(context,listen: false).toggleVisibility();
          },
          child: Consumer<ActionProvider>(

            builder: (context, provider , child){
              return Visibility(
                  visible: !provider.isVisible,
                  child: _isDark ? Image.asset(AppAssets.gift,) :Image.asset(AppAssets.giftR,) );
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(Get.width * 0.04,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: Get.width,
                        height: Get.height * 0.4,
                        child: Image.asset(
                          _isDark ? AppAssets.homeMap : AppAssets.homeMapl,
                          fit: BoxFit.contain,
                        )),
                    Center(
                      child: ButtonWidget(
                          text: "View matrics",
                          onClicked: () {},
                          width: Get.width * 0.36,
                          height: 40.0),
                    ),
                    SizedBox(
                      height: Get.width * 0.12,
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RoutesName.Instagram);
                            },
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      width: Get.width * 0.6,
                                      padding: EdgeInsets.only(
                                          left: 70, top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                        color: _isDark
                                            ? Colors.black
                                            : Color(0xFFEDE7F6),
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Intentos: 12',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: _isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Tiempo ahorrado: 30min.',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: _isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: _isDark
                                                ? Colors.black
                                                : Color(0xFFEDE7F6),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30.0,
                                          child: Image.asset(
                                            AppAssets.insta,
                                            width: 40.0,
                                            height: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      width: Get.width * 0.6,
                                      padding: EdgeInsets.only(
                                          left: 70, top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                        color: _isDark
                                            ? Colors.black
                                            : Color(0xFFEDE7F6),
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Intentos: 12',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: _isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                              Text(
                                                'Tiempo ahorrado: 30min.',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: _isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: _isDark
                                                ? Colors.black
                                                : Color(0xFFEDE7F6),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30.0,
                                          child: Image.asset(
                                            AppAssets.tiktok,
                                            width: 40.0,
                                            height: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    width: Get.width * 0.6,
                                    padding: EdgeInsets.only(
                                        left: 70, top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color: _isDark
                                          ? Colors.black
                                          : Color(0xFFEDE7F6),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Intentos: 15',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: _isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'Tiempo ahorrado: 30min.',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: _isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: _isDark
                                              ? Colors.black
                                              : Color(0xFFEDE7F6),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30.0,
                                        child: Image.asset(
                                          AppAssets.x,
                                          width: 40.0,
                                          height: 40.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    width: Get.width * 0.6,
                                    padding: EdgeInsets.only(
                                        left: 70, top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color: _isDark
                                          ? Colors.black
                                          : Color(0xFFEDE7F6),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Intentos: 12',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: _isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'Tiempo ahorrado: 30min.',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: _isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: _isDark
                                              ? Colors.black
                                              : Color(0xFFEDE7F6),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30.0,
                                        child: Image.asset(
                                          AppAssets.pinterest,
                                          width: 40.0,
                                          height: 40.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child:
                          GestureDetector(
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => CustomAlertDialog(),
                                );
                              },
                              child: Image.asset(_isDark ? AppAssets.addL : AppAssets.add)),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
                Consumer<ActionProvider>(
          builder: (context, provider, child) {
            return Visibility(
              visible: provider.isVisible,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            provider.toggleVisibility();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.card_giftcard,
                            size: 60,
                            color: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Gana un regalo',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'Explicación del sistema de recompensas para los usuarios',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isDark ? AppColors.appYellowColor : AppColors.appRedColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              // Add your onPressed code here!
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text('Ir',
                              style: TextStyle(
                                color:   Colors.white
                              ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
                ),
            ],
          ),
        ),
      ),
    );
  }

}
