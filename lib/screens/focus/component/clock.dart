import 'package:flutter/cupertino.dart';

import '../../../model/res/constant/app_assets.dart';
import '../../../model/res/widgets/button_widget.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.clock),
        ButtonWidget(text: 'Activate',
            onClicked: (){}, width: 150, height: 40)
      ],
    );
  }
}
