// To parse this JSON data, do
//
//     final yvStory = yvStoryFromJson(jsonString);

import 'dart:convert';

YvStory yvStoryFromJson(String str) => YvStory.fromJson(json.decode(str));

String yvStoryToJson(YvStory data) => json.encode(data.toJson());

class YvStory {
  String title;
  Theme theme;
  List<Moment> moments;

  YvStory({
    this.title,
    this.theme,
    this.moments,
  });

  factory YvStory.fromJson(Map<String, dynamic> json) => new YvStory(
    title: json["title"],
    theme: Theme.fromJson(json["theme"]),
    moments: new List<Moment>.from(json["moments"].map((x) => Moment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "theme": theme.toJson(),
    "moments": new List<dynamic>.from(moments.map((x) => x.toJson())),
  };
}

class Moment {
  int id;
  String type;
  String title;
  Content content;

  Moment({
    this.id,
    this.type,
    this.title,
    this.content,
  });

  factory Moment.fromJson(Map<String, dynamic> json) => new Moment(
    id: json["id"],
    type: json["type"],
    title: json["title"],
    content: Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "title": title,
    "content": content.toJson(),
  };
}

class Content {
  String text;
  List<Reference> references;
  String prompt;
  String title;
  String subtitle;
  String url;
  String image;
  double startTimeOffsetSeconds;
  double endTimeOffsetSeconds;
  double videoLengthSeconds;
  String plantitle;
  String author;
  List<Memory> memories;
  String commentDate;
  List<String> commentorsAvatars;

  Content({
    this.text,
    this.references,
    this.prompt,
    this.title,
    this.subtitle,
    this.url,
    this.image,
    this.startTimeOffsetSeconds,
    this.endTimeOffsetSeconds,
    this.videoLengthSeconds,
    this.plantitle,
    this.author,
    this.memories,
    this.commentDate,
    this.commentorsAvatars,
  });

  factory Content.fromJson(Map<String, dynamic> json) => new Content(
    text: json["text"] == null ? null : json["text"],
    references: json["references"] == null ? null : new List<Reference>.from(json["references"].map((x) => Reference.fromJson(x))),
    prompt: json["prompt"] == null ? null : json["prompt"],
    title: json["title"] == null ? null : json["title"],
    subtitle: json["subtitle"] == null ? null : json["subtitle"],
    url: json["url"] == null ? null : json["url"],
    image: json["image"] == null ? null : json["image"],
    startTimeOffsetSeconds: json["startTimeOffsetSeconds"] == null ? null : json["startTimeOffsetSeconds"],
    endTimeOffsetSeconds: json["endTimeOffsetSeconds"] == null ? null : json["endTimeOffsetSeconds"],
    videoLengthSeconds: json["videoLengthSeconds"] == null ? null : json["videoLengthSeconds"].toDouble(),
    plantitle: json["plantitle"] == null ? null : json["plantitle"],
    author: json["author"] == null ? null : json["author"],
    memories: json["memories"] == null ? null : new List<Memory>.from(json["memories"].map((x) => Memory.fromJson(x))),
    commentDate: json["commentDate"] == null ? null : json["commentDate"],
    commentorsAvatars: json["commentorsAvatars"] == null ? null : new List<String>.from(json["commentorsAvatars"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "text": text == null ? null : text,
    "references": references == null ? null : new List<dynamic>.from(references.map((x) => x.toJson())),
    "prompt": prompt == null ? null : prompt,
    "title": title == null ? null : title,
    "subtitle": subtitle == null ? null : subtitle,
    "url": url == null ? null : url,
    "image": image == null ? null : image,
    "startTimeOffsetSeconds": startTimeOffsetSeconds == null ? null : startTimeOffsetSeconds,
    "endTimeOffsetSeconds": endTimeOffsetSeconds == null ? null : endTimeOffsetSeconds,
    "videoLengthSeconds": videoLengthSeconds == null ? null : videoLengthSeconds,
    "plantitle": plantitle == null ? null : plantitle,
    "author": author == null ? null : author,
    "memories": memories == null ? null : new List<dynamic>.from(memories.map((x) => x.toJson())),
    "commentDate": commentDate == null ? null : commentDate,
    "commentorsAvatars": commentorsAvatars == null ? null : new List<dynamic>.from(commentorsAvatars.map((x) => x)),
  };
}

class Memory {
  String title;
  String date;
  String text;
  String avatar;

  Memory({
    this.title,
    this.date,
    this.text,
    this.avatar,
  });

  factory Memory.fromJson(Map<String, dynamic> json) => new Memory(
    title: json["title"],
    date: json["date"],
    text: json["text"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "date": date,
    "text": text,
    "avatar": avatar == null ? null : avatar,
  };
}

class Reference {
  String text;
  String ref;

  Reference({
    this.text,
    this.ref,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => new Reference(
    text: json["text"],
    ref: json["ref"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "ref": ref,
  };
}

class Theme {
  String primaryColor = "FF00FF";
  String uiColor = "FF00FF";
  String accentColor = "FF00FF";
  String backgroundColor = "FF00FF";
  String backgroundColor2 = "FF0000";

  Theme({
    this.primaryColor,
    this.uiColor,
    this.accentColor,
    this.backgroundColor,
    this.backgroundColor2,
  });

  factory Theme.fromJson(Map<String, dynamic> json) => new Theme(
    primaryColor: json["primaryColor"],
    uiColor: json["uiColor"],
    accentColor: json["accentColor"],
    backgroundColor: json["backgroundColor"],
    backgroundColor2: json["backgroundColor2"],
  );

  Map<String, dynamic> toJson() => {
    "primaryColor": primaryColor,
    "uiColor": uiColor,
    "accentColor": accentColor,
    "backgroundColor": backgroundColor,
    "backgroundColor2": backgroundColor2,
  };
}
