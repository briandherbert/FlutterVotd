//import 'package:flutter_app/model/votd_story.dart';
import 'package:flutter_app/model/yv_story.dart';
import 'package:flutter_app/ui/utils.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String BASE_URL = "https://s3.amazonaws.com/yv-stories/";
  static const String STORIES_URL = BASE_URL + "stories_info.json";

  static String _currentStoryId = "votd2";
  static YvStory _currentStory;

  static const String MOMENT_KEY_VERSE = "bible";
  static const String MOMENT_KEY_PRAYER = "prayer";
  static const String MOMENT_KEY_INTRO = "intro";
  static const String MOMENT_KEY_IMAGE = "image";
  static const String MOMENT_KEY_DEVO = "devotional";
  static const String MOMENT_KEY_REFLECTION = "reflection";
  static const String MOMENT_KEY_VIDEO = "video";
  static const String MOMENT_KEY_MEMORY = "memory";

  static getJsonUrl() {
    return BASE_URL + _currentStoryId + "story_info.json";
  }
  
  static String  getStoryUrl(String id) {
    print("getting story url for " + id);
    return BASE_URL + id + "/story_info.json";
  }

  static String getImageUrl(String filename) {
    if (filename == null) return "";
    return BASE_URL + _currentStoryId + "/" + filename;
  }

  static Color accentColor() {
    return Utils.colorFrom(_currentStory.theme.accentColor);
  }

  static Color bgColor() {
    return Utils.colorFrom(_currentStory.theme.backgroundColor);
  }
  
  static Color primaryColor() {
    return Utils.colorFrom(_currentStory.theme.primaryColor);
  }

  static Color uiColor() {
    return Utils.colorFrom(_currentStory.theme.uiColor);
  }

  static Widget getBg() {
    return Utils.getGradient(
        Constants._currentStory.theme.backgroundColor, Constants._currentStory.theme.backgroundColor2);
  }

  static const List<String> LOCAL_STORY_FILES = ["new", "prayer"];
  
  static setStoryData(String planId, YvStory story) {
    _currentStoryId = planId;
    _currentStory = story;
  }
}