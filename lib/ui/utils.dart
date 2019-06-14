import 'package:flutter/material.dart';

class Utils {
  static Container getGradient(String startHex, String endHex) {
    if (startHex == null) startHex = "FF00FF";
    if (endHex == null) {
      endHex = startHex;
    }

    return new Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [colorFrom(startHex), colorFrom(endHex)],
        ),
      ),
    );
  }

  static Color colorFrom(String hex) {
    if (hex == null) return Colors.red;
    if (hex.length == 6) hex = "FF" + hex;
    return Color(int.parse("0x$hex"));
  }

  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
