import 'package:flutter/material.dart';
import 'moment_widget.dart';

class PrayerMomentState extends MomentState {
  String txt = "PMS";
  int counter = 0;

  @override
  String getName() {
    return "Prayer";
  }

  @override
  Widget getContent() {
    return Container();
  }
}