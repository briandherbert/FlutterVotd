//import 'package:flutter_app/model/votd_story.dart';
import 'package:flutter_app/model/yv_story.dart';
import 'package:flutter_app/ui/utils.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String BASE_URL = "https://s3.amazonaws.com/yv-stories/";
  //static const String JSON_URL = BASE_URL + "story_info.json";
  static const String STORIES_URL = BASE_URL + "stories_info.json";

  static String PLAN = PLAN_VOTD;

  static const String MOMENT_KEY_VERSE = "bible";
  static const String MOMENT_KEY_PRAYER = "prayer";
  static const String MOMENT_KEY_INTRO = "intro";
  static const String MOMENT_KEY_IMAGE = "image";
  static const String MOMENT_KEY_DEVO = "devotional";
  static const String MOMENT_KEY_REFLECTION = "reflection";
  static const String MOMENT_KEY_VIDEO = "video";
  static const String MOMENT_KEY_MEMORY = "memory";

  static const String PLAN_VOTD = "votd2";
  static const String PLAN_PERSONAL = "personalized";
  static const String PLAN_HEALING = "healing";


  static getJsonUrl() {
    return BASE_URL + PLAN + "story_info.json";
  }

  static YvStory YV_STORY;

  static String getStoryUrl(String id) {
    print("getting story url for " + id);
    return BASE_URL + id + "/story_info.json";
  }

  static String getImageUrl(String filename) {
    if (filename == null) return "";
    return BASE_URL + PLAN + "/" + filename;
  }

  static Color bgColorLight() {
    return Utils.colorFrom(YV_STORY.theme.backgroundColor2);
  }

  static Color bgColorDark() {
    return Utils.colorFrom(YV_STORY.theme.backgroundColor);
  }
}