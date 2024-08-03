import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../model/res/constant/app_colors.dart';
import '../../../provider/theme/theme_provider.dart';

class NumbersButton extends StatefulWidget {
   NumbersButton({super.key});

  @override
  State<NumbersButton> createState() => _NumbersButtonState();
}

class _NumbersButtonState extends State<NumbersButton> {
  String hours = '00';

  String minutes = '00';

  String seconds = '00';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 15,),
        Text(
          '$hours\h $minutes\m $seconds\s',
          style: TextStyle(
            fontSize: 18.0,
            color: _isDark ? Colors.white:Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0,right: 28,top: 10,bottom: 0),
          child: Container(
              padding: EdgeInsets.only(right: 30,bottom:5,top: 5,left: 40,),
              width: double.infinity,
              height: Get.height / 4.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNumber('1'),
                          SizedBox(width: 25,),

                          buildNumber('2'),
                          SizedBox(width: 25,),

                          buildNumber('3'),
                        ]                                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNumber('4'),
                          SizedBox(width: 25,),

                          buildNumber('5'),
                          SizedBox(width: 25,),

                          buildNumber('6'),
                        ]                                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNumber('7'),
                          SizedBox(width: 25,),

                          buildNumber('8'),
                          SizedBox(width: 25,),

                          buildNumber('9'),
                        ]                                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNumber('0'),
                          SizedBox(width: 25,),
                          buildNumber('00'),
                          SizedBox(width: 25,),
                          buildDeleteButton(),
                        ]                                    ),
                  ),
                ],
              )),
        ),

      ],
    )
    ;
  }

  Container buildNumber(String text) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:  _isDark? Colors.grey.withOpacity(0.3):Color(0xffE1D7E9),
      ),
      child: Center(child: Text(text,)),
    );
  }

  void deleteInput() {
    setState(() {
      if (hours != '00' || minutes != '00' || seconds != '00') {
        seconds = seconds.substring(0, 1).padLeft(2, '0');
        minutes = minutes.substring(1, 2) + seconds.substring(0, 1);
        hours = hours.substring(1, 2) + minutes.substring(0, 1);
        if (hours == '0') hours = '00';
        if (minutes == '0') minutes = '00';
        if (seconds == '0') seconds = '00';
      }
    });
  }

  Widget buildDeleteButton() {
    return GestureDetector(
      onTap: deleteInput,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Center(
          child: Icon(
            Icons.backspace,size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
