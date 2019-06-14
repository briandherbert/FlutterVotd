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
  List<Resource> resources;

  YvStory({
    this.title,
    this.theme,
    this.moments,
    this.resources,
  });

  factory YvStory.fromJson(Map<String, dynamic> json) {
    YvStory story = new YvStory(
      title: json["title"],
      theme: Theme.fromJson(json["theme"]),
      moments:
          new List<Moment>.from(json["moments"].map((x) => Moment.fromJson(x))),
    );

    if (json.containsKey("resources")) {
      List<Resource> resources = new List<Resource>.from(
          json["resources"].map((x) => Resource.fromJson(x)));
      story.resources = resources;
    }

    return story;
  }

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
  String title;
  String text;
  String image;
  String plantitle;
  String author;
  String subtitle;
  String url;
  String imageTmp;
  double startTimeOffsetSeconds;
  double endTimeOffsetSeconds;
  double videoLengthSeconds;
  String prompt;
  String subject;
  List<String> quickOptions;
  List<Reference> references;
  List<Memory> memories;

  Content({
    this.title,
    this.text,
    this.image,
    this.plantitle,
    this.author,
    this.subtitle,
    this.url,
    this.imageTmp,
    this.startTimeOffsetSeconds,
    this.endTimeOffsetSeconds,
    this.videoLengthSeconds,
    this.prompt,
    this.subject,
    this.quickOptions,
    this.references,
    this.memories,
  });

  factory Content.fromJson(Map<String, dynamic> json) => new Content(
        title: json["title"] == null ? null : json["title"],
        text: json["text"] == null ? null : json["text"],
        image: json["image"] == null ? null : json["image"],
        plantitle: json["plantitle"] == null ? null : json["plantitle"],
        author: json["author"] == null ? null : json["author"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        url: json["url"] == null ? null : json["url"],
        imageTmp: json["image.tmp"] == null ? null : json["image.tmp"],
        startTimeOffsetSeconds: json["startTimeOffsetSeconds"] == null
            ? null
            : json["startTimeOffsetSeconds"],
        endTimeOffsetSeconds: json["endTimeOffsetSeconds"] == null
            ? null
            : json["endTimeOffsetSeconds"].toDouble(),
        videoLengthSeconds: json["videoLengthSeconds"] == null
            ? null
            : json["videoLengthSeconds"].toDouble(),
        prompt: json["prompt"] == null ? null : json["prompt"],
        subject: json["subject"] == null ? null : json["subject"],
        quickOptions: json["quickOptions"] == null
            ? null
            : new List<String>.from(json["quickOptions"].map((x) => x)),
        references: json["references"] == null
            ? null
            : new List<Reference>.from(
                json["references"].map((x) => Reference.fromJson(x))),
        memories: json["memories"] == null
            ? null
            : new List<Memory>.from(
                json["memories"].map((x) => Memory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "text": text == null ? null : text,
        "image": image == null ? null : image,
        "plantitle": plantitle == null ? null : plantitle,
        "author": author == null ? null : author,
        "subtitle": subtitle == null ? null : subtitle,
        "url": url == null ? null : url,
        "image.tmp": imageTmp == null ? null : imageTmp,
        "startTimeOffsetSeconds":
            startTimeOffsetSeconds == null ? null : startTimeOffsetSeconds,
        "endTimeOffsetSeconds":
            endTimeOffsetSeconds == null ? null : endTimeOffsetSeconds,
        "videoLengthSeconds":
            videoLengthSeconds == null ? null : videoLengthSeconds,
        "prompt": prompt == null ? null : prompt,
        "subject": subject == null ? null : subject,
        "quickOptions": quickOptions == null
            ? null
            : new List<dynamic>.from(quickOptions.map((x) => x)),
        "references": references == null
            ? null
            : new List<dynamic>.from(references.map((x) => x.toJson())),
        "memories": memories == null
            ? null
            : new List<dynamic>.from(memories.map((x) => x.toJson())),
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
  String accentColor;
  String backgroundColor;
  String backgroundColor2;
  String uiColor;
  String primaryColorOld;
  String primaryColor;

  Theme({
    this.accentColor,
    this.backgroundColor,
    this.backgroundColor2,
    this.uiColor,
    this.primaryColorOld,
    this.primaryColor,
  });

  factory Theme.fromJson(Map<String, dynamic> json) => new Theme(
        accentColor: json["accentColor"],
        backgroundColor: json["backgroundColor"],
        backgroundColor2: json["backgroundColor2"],
        uiColor: json["uiColor"],
        primaryColorOld: json["primaryColorOLD"],
        primaryColor: json["primaryColor"],
      );

  Map<String, dynamic> toJson() => {
        "accentColor": accentColor,
        "backgroundColor": backgroundColor,
        "backgroundColor2": backgroundColor2,
        "uiColor": uiColor,
        "primaryColorOLD": primaryColorOld,
        "primaryColor": primaryColor,
      };
}
