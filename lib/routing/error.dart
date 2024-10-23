
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/custom_widgets.dart';
import '../utils/dimensions.dart';
import '../utils/text_styles.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white54,
        height: Dimensions.screenHeight(context),
        width: Dimensions.screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomWidgets.text(
                title: Labels.somethingWentWrong,
                textStyle: LabelStyles.regularBlackTextStyle()),
          ],
        ),
      ),
    );
  }
}
