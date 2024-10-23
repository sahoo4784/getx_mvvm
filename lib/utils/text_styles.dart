import 'package:flutter/material.dart';

class LabelStyles {
  static TextStyle regularBlackTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: Colors.black,
      fontSize: fontSize ?? 15.0,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle regularRedTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: Colors.red,
      fontSize: fontSize ?? 15.0,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }
}
