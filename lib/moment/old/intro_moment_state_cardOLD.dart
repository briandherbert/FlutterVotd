import 'package:flutter/material.dart';

import '../moment_widget.dart';

class IntroMomentStateCardOLD extends MomentState {
  @override
  String getName() {
    return "Intro";
  }

  @override
  Widget getContent() {
    return Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            // Center card
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: new Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: new Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(Constants.getImageUrl(
                              widget.moment.content.image)),
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                  ]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3,
                  margin: EdgeInsets.all(40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: SizedBox(
              width: 220,
              height: 50,
              child: RaisedButton(
                  child: new Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    bool isnull = widget.pageController == null;
                    print("clicked button, next page, pagecontroller null? " + isnull.toString());
                    widget.pageController
                        ?.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
                  },
                  elevation: 0,
                  textColor: Constants.bgColor(),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            ),
          )
        ]);
  }
}
