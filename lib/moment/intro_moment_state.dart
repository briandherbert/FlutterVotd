import 'package:flutter/material.dart';

import 'moment_widget.dart';

class IntroMomentState extends MomentState {
  @override
  String getName() {
    return "Intro";
  }

  @override
  Widget getContent() {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: new Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: new Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: new NetworkImage(
                      Constants.getImageUrl(widget.moment.content.image)),
                  //image: AssetImage("assets/images/blurred_bg.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            //Image.asset("assets/images/blurred_bg.png", fit: BoxFit.fill)
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Good Morning",
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.moment.content.text,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ]),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(40),
        ),
      ),
    );
  }
}
