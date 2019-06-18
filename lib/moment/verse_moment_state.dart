import 'package:flutter/material.dart';
import 'package:flutter_app/model/yv_story.dart';

import 'moment_widget.dart';

class VerseMomentState extends MomentState {
  bool isCheckedMeditate = false;

  @override
  String getName() {
    return "Bible";
  }

  @override
  Widget getContent() {
    Reference bibleRef = widget.moment.content.references[0];

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
                bibleRef.text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Constants.primaryColor(), fontSize: 22),
              )),
          SizedBox(height: 20,),
          Text(
            bibleRef.ref,
            textAlign: TextAlign.center,
            style: TextStyle(color: Constants.uiColor(), fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
