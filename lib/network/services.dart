import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/constants.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app/model/stories_info.dart';
import 'package:flutter_app/model/yv_story.dart';
import 'package:http/http.dart' as http;

Future<YvStory> getYvStory(String storyId, bool fromFile) async {
  String url = Constants.getStoryUrl(storyId);
  print("get story, from file? " + fromFile.toString() + " url " + url);

  var decoded;
  String jsonStr;
  try {
    if (fromFile) {
      jsonStr = await rootBundle.loadString("assets/json/$storyId.json");
    } else {
      jsonStr = (await http.get(url)).body;
    }

    decoded = json.decode(jsonStr);
  } catch (e) {
    print("error: $e");
  }

  YvStory story;
  try {
    story = YvStory.fromJson(decoded);
  } catch (e) {
    print("error converting from json " + e.toString());
    throw e;
  }

  return story;
}

Future<StoriesInfo> getStories(String url) async {
  bool fromFile = false;
  print("get stories, from file? " + fromFile.toString() + " \nurl " + url);

  var decoded;
  String jsonStr;
  try {
    jsonStr = (await http.get(url)).body;
    decoded = json.decode(jsonStr);
  } catch (e) {
    print("error: $e");
  }

  StoriesInfo stories;
  try {
    stories = StoriesInfo.fromJson(decoded);
  } catch (e) {
    print("error converting from json " + e.toString());
  }

  return stories;
}
