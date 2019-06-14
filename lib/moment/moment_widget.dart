import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/model/yv_story.dart';
import 'package:flutter_app/moment/devo_moment_state.dart';
import 'package:flutter_app/moment/image_moment_state.dart';
import 'package:flutter_app/moment/intro_moment_state2.dart';
import 'package:flutter_app/moment/prayer_moment_state.dart';
import 'package:flutter_app/moment/reflect_moment_state.dart';
import 'package:flutter_app/moment/verse_moment_state.dart';
import 'package:flutter_app/moment/video_moment_state.dart';
import 'package:flutter_app/moment/todo_moment_state.dart';
import 'package:flutter_app/ui/utils.dart';

export 'package:flutter_app/constants.dart';

class MomentWidget extends StatefulWidget {
  final Moment moment;
  final int pageIdx;
  PageController pageController;

  MomentWidget(
      {Key key,
      @required this.moment,
      @required this.pageIdx,
      this.pageController})
      : super();

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
          return IntroMomentState2();
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

    return TodoMomentState();
  }
}

/// Base UI for moments. Override build(context) to go custom
abstract class MomentState extends State<MomentWidget> {
  bool isSettled = false;
  Content data; // convenience for subclass access
  bool showTextInputModal = false;

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [
      getBg(),
      Padding(
          padding: EdgeInsets.only(top: getTopPadding()),
          child: getContent()),
      Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 48.0),
          child:
          Container(height: 40,
              child: getHeader())),
    ];

    if (showTextInputModal) {
      children.add(Container(color: Colors.red,));
    }

    return new Scaffold(
        body: new Stack(
      children: children
    ));
  }

  void toggleTextInputModal(bool visible) {
    setState(() {
      showTextInputModal = visible;
    });
  }

  @override
  void initState() {
    widget.pageController.addListener(_onPagerUpdate);
    data = widget.moment.content;
    super.initState();
  }

  @override
  void dispose() {
    print("dispose " + getName());
    widget.pageController.removeListener(_onPagerUpdate);
    super.dispose();
  }

  void _onPagerUpdate() {
    double d = widget.pageController.page;
    if (d % 1 >= .99999999) d = d.ceil().toDouble();  //ViewPager bug
    bool newIsSettled = d % 1 == 0;

    if (isSettled != newIsSettled && (!newIsSettled || d.floor() == widget.pageIdx)) {
      setState(() {
        isSettled = newIsSettled;
      });
    }
  }

  Widget getBg() {
    return Utils.getGradient(
        Constants.YV_STORY.theme.backgroundColor, Constants.YV_STORY.theme.backgroundColor2);
  }

  double getTopPadding() {
    return 80.0;
  }

  Widget getHeader() {
    return new Row(children: <Widget>[
      Icon(
        Icons.close,
        color: isSettled ? Colors.white : Colors.transparent,
      ),
      Expanded(
        child: Text(
          getName().toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(color: Constants.bgColorLight()),
        ),
      ),
      Icon(
        Icons.share,
        color: isSettled ? Colors.white : Colors.transparent,
      ),
    ]);
  }

  Widget getContent();

  String getName();

  bool useTemplate() {
    return true;
  }
}
