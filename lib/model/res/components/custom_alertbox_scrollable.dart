import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/constant/app_colors.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

import '../../../provider/theme/theme_provider.dart';
import '../constant/app_assets.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: 500,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _isDark? AppColors.appBarColor: Color(0xffF3ECEC),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            AppTextWidget(
              text:
              'Add Applications',
              fontSize: 16, fontWeight: FontWeight.bold),
            SizedBox(height: 20,),
            Expanded(
              child: RawScrollbar(
                thumbVisibility: true,
                thickness: 3.0,
                radius: Radius.circular(10.0),
                thumbColor: _isDark ?AppColors.appYellowColor:AppColors.appRedColor,
                child: ListView(
                  children: [
                    buildStack(context, 'Instagram', AppAssets.insta,true),
                    buildStack(context, 'Tiktok', AppAssets.tiktok,false),
                    buildStack(context, 'X', AppAssets.x,true),
                    buildStack(context, 'Pinterest', AppAssets.pinterest,true),
                    buildStack(context, 'Nombre', AppAssets.dummy,true),
                    buildStack(context, 'Nombre', AppAssets.dummy,true),
                    buildStack(context, 'Nombre', AppAssets.dummy,true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStack(BuildContext context, String name, String image,bool isCheck) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: Get.width * 0.6,
            padding: EdgeInsets.only(left: 70, top: 13, bottom: 13),
            decoration: BoxDecoration(
              color: _isDark ? Colors.black54 : Color(0xFFDDD3E6),
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: _isDark ? Colors.black:Color(0xffDDD3E6))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppTextWidget(
                  text: name,
                    fontSize: 14.0,
                    color: _isDark ? Colors.white : Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _isDark ? Colors.black : Color(0xFFEDE7F6),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: CircleAvatar(
                      backgroundColor: isCheck ? Colors.green: Colors.white,
                      radius: 12.0,
                      child: Icon(Icons.check,size: 15,color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isDark ? Colors.black : Color(0xFFEDE7F6),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: CircleAvatar(
                backgroundColor: _isDark ? Colors.black : Colors.white,
                radius: 25.0,
                child: Image.asset(
                  image,
                  width: 40.0,
                  height: 40.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
