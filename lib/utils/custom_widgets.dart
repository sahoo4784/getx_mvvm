
import 'package:flutter/material.dart';
import 'package:getx_mvvm/utils/text_styles.dart';

import 'dimensions.dart';

class CustomWidgets {
  static Text text({String? title, TextStyle? textStyle}) {
    return Text(
      title!,
      style: textStyle,
    );
  }

  static SizedBox verticalSpacing({required double height}) {
    return SizedBox(
      height: height,
    );
  }

  static Future showBottomSheet(
      {required BuildContext context,
      required Widget body,
      BoxShape? shape,
      required double bottomSheetHeight,
      bool? isDismissable,
      double? elevation}) {
    return showModalBottomSheet(
        isDismissible: isDismissable ?? false,
        elevation: elevation ?? 0,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Container(
              height: bottomSheetHeight ?? 200,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10)),
              width: Dimensions.screenWidth(context) / 1.9,
              child: body);
        });
  }

  static MaterialButton appButton(
      {required VoidCallback onPressed,
      required String buttonLabel,
      ShapeBorder? shape,
      required Color? color,
      double? height,
      double? elevation,
      EdgeInsets? padding,
      TextStyle? buttonLabelStyle,
      double? width}) {
    return MaterialButton(
      onPressed: onPressed,
      shape: shape ?? const StadiumBorder(),
      color: color,
      height: height ?? 45.0,
      elevation: elevation ?? 0.0,
      padding: padding ?? EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
        child: Text(
          buttonLabel ?? '',
          style: buttonLabelStyle ??
              const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  static TextFormField appTextField(
      {TextStyle? labelStyle,
      required TextEditingController controller,
      bool? enabled,
      FocusNode? focusNode,
      String? errorMessage,
      String? hintText,
      required ValueChanged<String> onChanged}) {
    return TextFormField(
      style: labelStyle ?? LabelStyles.regularBlackTextStyle(),
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          hintText: hintText ?? "",
          errorText: errorMessage),
      enabled: enabled ?? true,
      focusNode: focusNode,
      onChanged: onChanged,
    );
  }
}
