import 'package:flutter_app/model/votd_story.dart';

class Constants {
  static const String BASE_URL = "https://s3.amazonaws.com/yv-stories/votd/";
  static const String JSON_URL = BASE_URL + "story_info.json";

  static const String MOMENT_KEY_VERSE = "bible";
  static const String MOMENT_KEY_PRAYER = "prayer";
  static const String MOMENT_KEY_INTRO = "intro";
  static const String MOMENT_KEY_IMAGE = "image";
  static const String MOMENT_KEY_DEVO = "devotional";
  static const String MOMENT_KEY_REFLECTION = "reflection";

  static VotdStory VOTD_STORY;

  static getImageUrl(String filename) {
    return BASE_URL + filename;
  }
}