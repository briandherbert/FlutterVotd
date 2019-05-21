import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/ui/utils.dart';
import 'package:flutter_app/moment/prayer_moment_state.dart';
import 'package:flutter_app/moment/verse_moment_state.dart';
import 'package:flutter_app/moment/intro_moment_state.dart';
import 'package:flutter_app/moment/image_moment_state.dart';
import 'package:flutter_app/model/votd_story.dart';
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
            Utils.getGradient(Constants.VOTD_STORY.theme.bgDark, Constants.VOTD_STORY.theme.bgLight),
            new Center(
              child: new Text(getName()),
            ),
            getContent(),
          ],
        )
    );
  }

  Widget getContent();

  String getName();

  bool useTemplate() {
    return true;
  }
}
