import 'package:flutter/material.dart';

class Utils {
  static Container getGradient(String startHex, String endHex) {
    if (startHex.length == 6) startHex = "FF" + startHex;
    if (endHex.length == 6) endHex = "FF" + endHex;

    print("start color $startHex end color $endHex");

    Color startColor = Color(int.parse("0x$startHex"));
    Color endColor = Color(int.parse("0x$endHex"));

    return new Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [startColor, endColor],
        ),
      ),
    );
  }
}
