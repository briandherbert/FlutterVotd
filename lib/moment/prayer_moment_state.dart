import 'package:flutter/material.dart';
import 'moment_widget.dart';

class PrayerMomentState extends State<MomentWidget> {
  String txt = "PMS";
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Text("PMS" + counter.toString()),
        onTap: () {
          setState(() {
            counter++;
          });
        });
  }
}