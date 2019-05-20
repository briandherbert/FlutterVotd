import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/moment/verse_moment_state.dart';
import 'package:flutter_app/moment/prayer_moment_state.dart';

class MomentWidget extends StatefulWidget {
  final String keyword;

  MomentWidget({Key key, @required this.keyword}) : super();

  @override
  State<StatefulWidget> createState() {
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
    }
  }
}