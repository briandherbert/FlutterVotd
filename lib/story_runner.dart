import 'package:flutter/material.dart';
import 'package:flutter_app/model/votd_story.dart';
import 'package:flutter_app/moment/moment_widget.dart';

import 'constants.dart';
import 'network/services.dart';

class StoryRunner extends StatelessWidget {
  final String url;
  var momentKeywords = {
    Constants.MOMENT_KEY_INTRO,
    Constants.MOMENT_KEY_PRAYER,
    Constants.MOMENT_KEY_VERSE
  };
  int _momentIdx = 0;

  StoryRunner({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<VotdStory>(
              future: getVotdStory(url),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Constants.VOTD_STORY = snapshot.data;

                  return GestureDetector(
                    child: Text("data ${snapshot.data.title}"),
                    onTap: () => _nextMoment(context),
                  );
                } else {
                  return Text("loading data");
                }
              })),
    );
  }

  void _nextMoment(BuildContext context) {
    print("next moment idx " + _momentIdx.toString());
    if (_momentIdx >= momentKeywords.length) return;

    String keyword = momentKeywords.elementAt(_momentIdx);
    Moment moment = Constants.VOTD_STORY.moments.elementAt(_momentIdx);
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return GestureDetector(
          child: WillPopScope(
            child: MomentHolder(moment: moment),
            onWillPop: _willPopCallback,
          ),
          onTap: () => _nextMoment(context),
        );
      }),
    );

    _momentIdx++;
  }

  Future<bool> _willPopCallback() async {
    _momentIdx--;
    return true;
  }
}

class MomentHolder extends StatelessWidget {
  final Moment moment;

  MomentHolder({Key key, @required this.moment}) : super();

  @override
  Widget build(BuildContext context) {
    return generateWidget(moment);
  }

  Widget generateWidget(Moment moment) {
    return MomentWidget(moment: moment,);
  }
}
