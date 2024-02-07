import 'dart:convert';
import 'dart:io';

class UploadModel {
  String? nameStr;
  String? nameInt;
  String? nameBool;
  List<File>? images;
  List<File>? videos;
  List<File>? docs;

  UploadModel({
    this.nameStr,
    this.nameInt,
    this.nameBool,
    this.images,
    this.videos,
    this.docs,
  });

  UploadModel copyWith({
    String? nameStr,
    String? nameInt,
    String? nameBool,
    List<File>? images,
    List<File>? videos,
    List<File>? docs,
  }) =>
      UploadModel(
        nameStr: nameStr ?? this.nameStr,
        nameInt: nameInt ?? this.nameInt,
        nameBool: nameBool ?? this.nameBool,
        images: images ?? this.images,
        videos: videos ?? this.videos,
        docs: docs ?? this.docs,
      );

  factory UploadModel.fromRawJson(String str) =>
      UploadModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UploadModel.fromJson(Map<String, dynamic> json) => UploadModel(
        nameStr: json["nameStr"],
        nameInt: json["nameInt"],
        nameBool: json["nameBool"],
        images: json["images"] == null
            ? []
            : List<File>.from(json["images"]!.map((x) => x)),
        videos: json["videos"] == null
            ? []
            : List<File>.from(json["videos"]!.map((x) => x)),
        docs: json["docs"] == null
            ? []
            : List<File>.from(json["docs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "nameStr": nameStr,
        "nameInt": nameInt,
        "nameBool": nameBool,
        "images": images == null ? [] : List<File>.from(images!.map((x) => x)),
        "videos": videos == null ? [] : List<File>.from(videos!.map((x) => x)),
        "docs": docs == null ? [] : List<File>.from(docs!.map((x) => x)),
      };
}
