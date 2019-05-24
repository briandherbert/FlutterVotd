import 'package:flutter/material.dart';

import 'moment_widget.dart';

class ReflectMomentState extends MomentState {
  @override
  String getName() {
    return "Reflect";
  }

  @override
  Widget getContent() {
    return Center(
        child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Column(
        children: <Widget>[Text(widget.moment.content.prompt)],
      ),
    ));
  }
}
