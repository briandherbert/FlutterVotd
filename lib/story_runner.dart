import 'package:flutter/material.dart';
import 'package:flutter_app/model/votd_story.dart';
import 'package:flutter_app/moment/moment_widget.dart';
import 'package:flutter_app/ui/page_indicator.dart';
import 'package:flutter_app/ui/utils.dart';

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

  bool usePager = true;

  final PageController controller = new PageController();

  StoryRunner({Key key, @required this.url}) : super(key: key);

  PageIndicator pageIndicator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<VotdStory>(
              future: getVotdStory(url),
              builder: (context, snapshot) {
                Constants.VOTD_STORY = snapshot.data;

                if (usePager) {
                  print("using pager $usePager");

                  if (!snapshot.hasData) {
                    return new Text("Fetching data...");
                  }

                  return Scaffold(
                    body: new Stack(
                      children: <Widget>[
                        Utils.getGradient(Constants.VOTD_STORY.theme.bgDark,
                            Constants.VOTD_STORY.theme.bgLight),
                        Padding(
                          padding: const EdgeInsets.only(top: 48),
                          child: PageView(
                            children: _createPages(snapshot.data.moments),
                            controller: controller,
                            onPageChanged: (index) {
                              // TODO: How to propagate this?
                              print("page changed to ${controller.page}");
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: PageIndicator(
                              controller: controller,
                              count: snapshot.data.moments.length),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Dismissible(
                    resizeDuration: null,
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.endToStart) {
                        _nextMoment(context);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    key: new ValueKey(_momentIdx),
                    child: new Center(
                      child: new Text("Loaded, swipe to proceed"),
                    ),
                  );
                } else {
                  return Text("loading data...");
                }
              })),
    );
  }

  /// Each page is its own Route/Activity
  void _nextMoment(BuildContext context) {
    print("next moment idx " + _momentIdx.toString());
    if (_momentIdx >= momentKeywords.length) return;

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

  /// Each page is a widget in a pager
  List<Widget> _createPages(List<Moment> moments) {
    List<Widget> momentWidgets = new List<MomentHolder>();
    for (Moment moment in moments) {
      momentWidgets.add(new MomentHolder(moment: moment));
    }

    return momentWidgets;
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
    return MomentWidget(
      moment: moment,
    );
  }
}
