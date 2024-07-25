import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../provider/toggle/toggle_provider.dart';

class ToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var toggleModel = Provider.of<ToggleModel>(context);
    return SizedBox(
      width: Get.width * 0.6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (toggleModel.isCronometer) toggleModel.toggle();
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      toggleModel.isCronometer ? Colors.black : Color(0xffFFCC38),
                      toggleModel.isCronometer ? Colors.black : Color(0xffFF5000),
                    ],
                  ),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: Center(
                  child: Text(
                    'Timer',
                    style: TextStyle(
                      color: toggleModel.isCronometer ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!toggleModel.isCronometer) toggleModel.toggle();
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      toggleModel.isCronometer ? Color(0xffFFCC38) : Colors.black,
                      toggleModel.isCronometer ? Color(0xffFF5000) : Colors.black,
                    ],
                  ),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Center(
                  child: Text(
                    'Cronometer',
                    style: TextStyle(
                      color: toggleModel.isCronometer ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
