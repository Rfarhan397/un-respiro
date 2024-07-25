import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../model/res/constant/app_colors.dart';

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
    return Column(
      children: [
        Text(
          '$hours\h $minutes\m $seconds\s',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        Container(
            padding: EdgeInsets.only(right: 40,bottom:5,top: 20,left: 40,),
            width: double.infinity,
            height: Get.height / 2.6,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNumber('1'),
                        buildNumber('2'),
                        buildNumber('3'),
                      ]                                    ),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNumber('4'),
                        buildNumber('5'),
                        buildNumber('6'),
                      ]                                    ),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNumber('7'),
                        buildNumber('8'),
                        buildNumber('9'),
                      ]                                    ),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNumber('0'),
                        buildNumber('00'),
                        buildDeleteButton(),
                      ]                                    ),
                ),
              ],
            )),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.appYellowColor,),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.play_arrow_outlined,color: Colors.white,
            ),
          ),
        )
      ],
    )
    ;
  }

  Container buildNumber(String text) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey.shade900,
      ),
      child: Center(child: Text(text)),
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
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey.shade900,
        ),
        child: Center(
          child: Icon(
            Icons.backspace,size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
