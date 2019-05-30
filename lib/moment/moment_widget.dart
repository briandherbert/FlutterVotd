import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/votd_story.dart';
import 'package:flutter_app/moment/image_moment_state.dart';
import 'package:flutter_app/moment/intro_moment_state.dart';
import 'package:flutter_app/moment/prayer_moment_state.dart';
import 'package:flutter_app/moment/verse_moment_state.dart';
import 'package:flutter_app/moment/devo_moment_state.dart';
import 'package:flutter_app/moment/reflect_moment_state.dart';
import 'package:flutter_app/moment/video_moment_state.dart';
import 'package:flutter_app/ui/utils.dart';

export 'package:flutter_app/constants.dart';

class MomentWidget extends StatefulWidget {
  final Moment moment;
  PageController pageController;

  MomentWidget({Key key, @required this.moment, this.pageController}) : super();

  @override
  MomentState createState() {
    String keyword = this.moment.type;
    print("generate widget " + keyword);

    switch (keyword) {
      case Constants.MOMENT_KEY_VERSE:
        {
          return VerseMomentState();
        }

      case Constants.MOMENT_KEY_PRAYER:
        {
          return PrayerMomentState();
        }

      case Constants.MOMENT_KEY_INTRO:
        {
          return IntroMomentState();
        }

      case Constants.MOMENT_KEY_IMAGE:
        {
          return ImageMomentState();
        }

      case Constants.MOMENT_KEY_DEVO:
        {
          return DevoMomentState();
        }

      case Constants.MOMENT_KEY_REFLECTION:
        {
          return ReflectMomentState();
        }

      case Constants.MOMENT_KEY_VIDEO:
        {
          return VideoMomentState();
        }
    }
  }
}

/// Base UI for moments. Override build(context) to go custom
abstract class MomentState extends State<MomentWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            getBg(),
            Padding(
              padding: EdgeInsets.only(top: getTopPadding()),
              child: getContent(),
            ),
            getHeader()
          ],
        ));
  }

  Widget getBg() {
    return Utils.getGradient(Constants.VOTD_STORY.theme.bgDark,
        Constants.VOTD_STORY.theme.bgLight);
  }

  double getTopPadding() {
    return 48.0;
  }

  Widget getHeader() {
    return new Row(
        children: <Widget>[
          Icon(Icons.close, color: Colors.white,),
          Icon(Icons.share, color: Colors.white,),
          ]
    );
  }

  Widget _getAppBar() {
    if (Platform.isAndroid || true) {
      return new AppBar(
        title: Text(
          getName(),
          style: TextStyle(color: Constants.bgColorLight()),
        ),
        elevation: 0,
        backgroundColor: Constants.bgColorDark(),
        iconTheme: IconThemeData(color: Constants.bgColorLight()),
      );
    }

    return AppBar(
      title: Text(getName()),
    );
  }

  Widget getContent();

  String getName();

  bool useTemplate() {
    return true;
  }
}
