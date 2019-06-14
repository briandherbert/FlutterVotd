import 'package:flutter/material.dart';

import 'moment_widget.dart';

class IntroMomentState2 extends MomentState {
  @override
  String getName() {
    return "Intro";
  }

  @override
  double getTopPadding() {
    return 0.0;
  }

  @override
  Widget getContent() {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                Constants.getImageUrl(widget.moment.content.image)),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                "Good Morning",
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              widget.moment.content.text,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: new Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              color: Colors.white,
              onPressed: () {
                bool isnull = widget.pageController == null;
                print("clicked button, next page, pagecontroller null? " +
                    isnull.toString());
                widget.pageController?.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.easeOut);
              },
              elevation: 0,
              textColor: Constants.bgColorDark(),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),
        ),
      )
    ]);
  }
}
