import 'package:flutter/material.dart';
import 'package:flutter_app/model/yv_story.dart';
import 'package:flutter_app/moment/moment_widget.dart';
import 'package:flutter_app/ui/page_indicator.dart';

import 'constants.dart';
import 'network/services.dart';

class StoryRunner extends StatelessWidget {
  final String storyId;
  final List<String> momentKeywords = [
    Constants.MOMENT_KEY_INTRO,
    Constants.MOMENT_KEY_PRAYER,
    Constants.MOMENT_KEY_VERSE
  ];

  final bool usePager = true;
  int _momentIdx = 0;


  final PageController controller = new PageController();

  StoryRunner({Key key, @required this.storyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<YvStory>(
              future: getYvStory(Constants.getStoryUrl(storyId)),
              builder: (context, snapshot) {
                Constants.PLAN = storyId;
                Constants.YV_STORY = snapshot.data;

                print("future builder connection state " + snapshot.connectionState.toString() + " has error " + snapshot.hasError.toString());

                if (snapshot.hasError) {
                  throw snapshot.error;
                }

                if (usePager) {
                  print("using pager $usePager");
                  if (!snapshot.hasData) {
                    return new Text("Fetching data...");
                  }

                  print("got data " + snapshot.data.toString());

                  return Scaffold(
                    body: new Stack(
                      children: <Widget>[
                        PageView(
                          children: _createPages(snapshot.data.moments),
                          controller: controller,
                          onPageChanged: (index) {
                            // TODO: How to propagate this? Returns double
                            // Solved - pass the controller to children
                          },
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
                  // Old approach, uses route queue like Activities
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

    Moment moment = Constants.YV_STORY.moments.elementAt(_momentIdx);
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return GestureDetector(
          child: WillPopScope(
              child: MomentWidget(moment: moment),
              onWillPop: () async {
                _momentIdx--;
                return true;
              }),
          onTap: () => _nextMoment(context),
        );
      }),
    );

    _momentIdx++;
  }

  /// Each page is a widget in a pager
  List<Widget> _createPages(List<Moment> moments) {
    List<Widget> momentWidgets = new List<MomentWidget>();
    for (int i = 0; i < moments.length; i++) {
      momentWidgets.add(new MomentWidget(
          moment: moments.elementAt(i),
          pageIdx: i,
          pageController: controller));
    }

    return momentWidgets;
  }
}
