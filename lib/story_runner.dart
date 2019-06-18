import 'package:flutter/material.dart';
import 'package:flutter_app/model/yv_story.dart';
import 'package:flutter_app/moment/moment_widget.dart';
import 'package:flutter_app/ui/page_indicator.dart';

import 'constants.dart';
import 'network/services.dart';

class StoryRunner extends StatelessWidget {
  final String storyId;
  final bool fromFile;
  final List<String> momentKeywords = [
    Constants.MOMENT_KEY_INTRO,
    Constants.MOMENT_KEY_PRAYER,
    Constants.MOMENT_KEY_VERSE
  ];

  final PageController controller = new PageController();

  StoryRunner({Key key, @required this.storyId, @required this.fromFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build story runner, from file " +
        this.fromFile.toString() +
        " with id " +
        storyId);

    return Scaffold(
      body: Center(
          child: FutureBuilder<YvStory>(
              future: getYvStory(storyId, fromFile),
              builder: (context, snapshot) {
                Constants.setStoryData(storyId, snapshot.data);

                print("future builder connection state " +
                    snapshot.connectionState.toString() +
                    " has error " +
                    snapshot.hasError.toString());

                if (snapshot.hasError) {
                  throw snapshot.error;
                }

                if (snapshot.hasData) {
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
                } else {
                  return Text("loading data...");
                }
              })),
    );
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
