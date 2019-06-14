import 'dart:convert';

StoriesInfo storiesInfoFromJson(String str) => StoriesInfo.fromJson(json.decode(str));

String storiesInfoToJson(StoriesInfo data) => json.encode(data.toJson());

class StoriesInfo {
  List<String> storyIds;

  StoriesInfo({
    this.storyIds,
  });

  factory StoriesInfo.fromJson(Map<String, dynamic> json) => new StoriesInfo(
    storyIds: new List<String>.from(json["storyIds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "storyIds": new List<dynamic>.from(storyIds.map((x) => x)),
  };
}