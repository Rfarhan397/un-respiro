import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unrespiro/model/res/components/app_button_widget.dart';
import 'package:unrespiro/model/res/constant/app_assets.dart';
import 'package:unrespiro/model/res/constant/app_string.dart';
import 'package:unrespiro/model/res/widgets/app_text.dart.dart';

import '../../model/res/widgets/button_widget.dart';
import '../../provider/theme/theme_provider.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final _isDark = themeProvider.isDarkMode;
    return Scaffold(
      backgroundColor: _isDark ? Colors.black:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: AppTextWidget(text: 'Update',fontSize: 16,),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Image.asset(
                          AppAssets.phone,height: 400,)),
                        SizedBox(height: 15,),
                        AppTextWidget(
                          text: "New “Friends” Update",
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        SizedBox(height: 35,),
                        AppTextWidget(
                          text: AppString.confirm_text,
                          color: Colors.black,
                        ),
                        SizedBox(height: 35,),
                        ButtonWidget(
                            text: 'And',
                            onClicked: (){},
                            width: 100, height: 35)
                      ],
                    ),
            ),
          )),
    );
  }
}
