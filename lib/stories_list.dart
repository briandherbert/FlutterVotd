import 'package:flutter/material.dart';
import 'package:flutter_app/model/stories_info.dart';
import 'story_runner.dart';

import 'constants.dart';
import 'network/services.dart';

class StoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Select a story"),),
      body: Center(
          child: FutureBuilder<StoriesInfo>(
              future: getStories(Constants.STORIES_URL),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading stories...");
                } else {

                  List<String> ids = snapshot.data.storyIds;
                  for (String name in ids) {}

                  //return Text("got story data ");

                  return ListView.builder(
                      itemCount: ids.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(ids[i]),
                          onTap: () {
                            String story_id = ids[i];
                            print("tapped idx " + i.toString() + " which is " + story_id);
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(builder: (BuildContext context) {
                                return StoryRunner(storyId: story_id,);
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
