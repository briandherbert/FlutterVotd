import 'package:flutter/material.dart';
//import 'package:flutter_app/model/votd_story.dart';
import 'package:flutter_app/model/yv_story.dart';

import '../moment_widget.dart';

class VerseMomentStateOLD extends MomentState {
  bool isCheckedMeditate = false;

  @override
  String getName() {
    return "Bible";
  }

  @override
  Widget getContent() {
    Reference bibleRef = widget.moment.content.references[0];
    String text = bibleRef.text + "\n\n" + bibleRef.ref;

    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Padding( // hmmm, padding in padding?
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ),
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: isCheckedMeditate,
                onChanged: (bool value) {
                  setState(() {
                    isCheckedMeditate = !isCheckedMeditate;
                  });
                },
              ),
              Flexible(
                child: Text("I want to meditate on this scripture later today",
                style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        )
      ],
    );
  }
}
