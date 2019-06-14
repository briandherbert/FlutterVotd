import 'package:flutter/material.dart';

import 'moment_widget.dart';

class DevoMomentState extends MomentState {
  @override
  String getName() {
    return "Devotional";
  }

  @override
  Widget getContent() {
    print("img " + Constants.getImageUrl(widget.moment.content.image));
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Expanded(
            child: new Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              child: new Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "DEVOTIONAL",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              fontSize: 20),
                        ),
                        Text(
                          widget.moment.content.author,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black26),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "⎻⎻⎻⎻⎻⎻⎻⎻ " + widget.moment.content.subtitle + "  ⎻⎻⎻⎻⎻⎻⎻⎻",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          widget.moment.content.text,
                          style: TextStyle(
                            fontSize: 16.0,

                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: 80,
              child: new Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  child: Row(children: <Widget>[
                    Image.network(
                      Constants.getImageUrl(widget.moment.content.image),
                      fit: BoxFit.contain,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Devotional taken from:",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.black26, fontSize: 10),
                            ),
                            Text(
                              widget.moment.content.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.moment.content.author,
                              style: TextStyle(color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                    )
                  ])),
            ),
          )
        ]),
      ),
    );
  }
}
