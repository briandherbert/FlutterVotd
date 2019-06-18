import 'package:flutter/material.dart';
import 'package:flutter_app/model/stories_info.dart';

import 'constants.dart';
import 'network/services.dart';
import 'story_runner.dart';

class StoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a story"),
      ),
      body: Center(
          child: FutureBuilder<StoriesInfo>(
              future: getStories(Constants.STORIES_URL),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading stories...");
                } else {
                  List<String> ids = [];
                  ids.addAll(snapshot.data.storyIds);
                  int numRemotes = ids.length;

                  ids.addAll(Constants.LOCAL_STORY_FILES);

                  return ListView.builder(
                      itemCount: ids.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(
                            ids[i],
                            style: TextStyle(),
                          ),
                          subtitle: Text((i < numRemotes) ? "" : "Local File"),
                          onTap: () {
                            String storyId = ids[i];
                            print("tapped idx " +
                                i.toString() +
                                " which is " +
                                storyId);
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                return StoryRunner(
                                    storyId: storyId,
                                    fromFile: (i >= numRemotes));
                              }),
                            );
                          },
                        );
                      });
                }
              })),
    );
  }
}
