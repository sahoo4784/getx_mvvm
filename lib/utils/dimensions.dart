import 'package:flutter/cupertino.dart';

class Dimensions {
  static screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
