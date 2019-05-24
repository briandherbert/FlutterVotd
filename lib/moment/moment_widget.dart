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
import 'package:flutter_app/ui/utils.dart';

export 'package:flutter_app/constants.dart';

class MomentWidget extends StatefulWidget {
  final Moment moment;

  MomentWidget({Key key, @required this.moment}) : super();

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
            getContent(),
          ],
        ));
  }

  Widget getBg() {
    return Utils.getGradient(Constants.VOTD_STORY.theme.bgDark,
        Constants.VOTD_STORY.theme.bgLight);
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

  Widget _getPageIndicator(int selectedIdx) {
    print("get page at idx " + selectedIdx.toString());
    int numMoments = Constants.VOTD_STORY.moments.length;

    var moments = List<Widget>();
    for (int i = 0; i < numMoments; i++) {
      moments.add(new Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
          child: Container(
            color: _getPageSelectorColor(i <= selectedIdx),
            height: 4,
          ),
        ),
      ));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      ]..addAll(moments),
    );
  }

  _getPageSelectorColor(bool selected) {
    if (selected) return Colors.white;
    return Colors.white12;
  }

  Widget getContent();

  String getName();

  bool useTemplate() {
    return true;
  }
}
