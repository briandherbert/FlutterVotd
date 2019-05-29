//https://s3.amazonaws.com/yv-stories/votd/story_info.json
// https://app.quicktype.io/  <- converter

// To parse this JSON data, do
//
//     final votdStory = votdStoryFromJson(jsonString);

import 'dart:convert';

VotdStory votdStoryFromJson(String str) => VotdStory.fromJson(json.decode(str));

String votdStoryToJson(VotdStory data) => json.encode(data.toJson());

class VotdStory {
  String title;
  Theme theme;
  List<Moment> moments;
  List<Resource> resources;

  VotdStory({
    this.title,
    this.theme,
    this.moments,
    this.resources,
  });

  factory VotdStory.fromJson(Map<String, dynamic> json) => new VotdStory(
        title: json["title"],
        theme: Theme.fromJson(json["theme"]),
        moments: new List<Moment>.from(
            json["moments"].map((x) => Moment.fromJson(x))),
        resources: new List<Resource>.from(
            json["resources"].map((x) => Resource.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "theme": theme.toJson(),
        "moments": new List<dynamic>.from(moments.map((x) => x.toJson())),
        "resources": new List<dynamic>.from(resources.map((x) => x.toJson())),
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
  String image;
  String title;
  String author;
  String subtitle;
  String prompt;
  String url;
  double startTimeOffsetSeconds;
  double endTimeOffsetSeconds;
  double videoLengthSeconds;
  List<Reference> references;

  Content({
    this.text,
    this.image,
    this.title,
    this.author,
    this.subtitle,
    this.prompt,
    this.url,
    this.startTimeOffsetSeconds,
    this.endTimeOffsetSeconds,
    this.videoLengthSeconds,
    this.references,
  });

  factory Content.fromJson(Map<String, dynamic> json) => new Content(
        text: json["text"] == null ? null : json["text"],
        image: json["image"] == null ? null : json["image"],
        title: json["title"] == null ? null : json["title"],
        author: json["author"] == null ? null : json["author"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        prompt: json["prompt"] == null ? null : json["prompt"],
        url: json["url"] == null ? null : json["url"],
        startTimeOffsetSeconds: json["startTimeOffsetSeconds"] == null ? null : json["startTimeOffsetSeconds"],
        endTimeOffsetSeconds: json["endTimeOffsetSeconds"] == null ? null : json["endTimeOffsetSeconds"],
        videoLengthSeconds: json["videoLengthSeconds"] == null ? null : json["videoLengthSeconds"],
        references: json["references"] == null
            ? null
            : new List<Reference>.from(
                json["references"].map((x) => Reference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "image": image == null ? null : image,
        "title": title == null ? null : title,
        "author": author == null ? null : author,
        "subtitle": subtitle == null ? null : subtitle,
        "prompt": prompt == null ? null : prompt,
        "url": url == null ? null : url,
        "startTimeOffsetSeconds": startTimeOffsetSeconds == null ? null : startTimeOffsetSeconds,
        "endTimeOffsetSeconds": endTimeOffsetSeconds == null ? null : endTimeOffsetSeconds,
        "videoLengthSeconds": videoLengthSeconds == null ? null : videoLengthSeconds,
        "references": references == null
            ? null
            : new List<dynamic>.from(references.map((x) => x.toJson())),
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

class Resource {
  String image;

  Resource({
    this.image,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => new Resource(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class Theme {
  String bgLight;
  String bgDark;
  String textLight;
  String textDark;

  Theme({
    this.bgLight,
    this.bgDark,
    this.textLight,
    this.textDark,
  });

  factory Theme.fromJson(Map<String, dynamic> json) => new Theme(
        bgLight: json["bgLight"],
        bgDark: json["bgDark"],
        textLight: json["textLight"],
        textDark: json["textDark"],
      );

  Map<String, dynamic> toJson() => {
        "bgLight": bgLight,
        "bgDark": bgDark,
        "textLight": textLight,
        "textDark": textDark,
      };
}
