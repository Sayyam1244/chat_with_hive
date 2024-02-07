import 'dart:convert';

class ProfileGridModel {
  String? location;
  String? name;
  String? designation;
  String? image;

  ProfileGridModel({
    this.location,
    this.name,
    this.designation,
    this.image,
  });

  ProfileGridModel copyWith({
    String? location,
    String? name,
    String? designation,
    String? image,
  }) =>
      ProfileGridModel(
        location: location ?? this.location,
        name: name ?? this.name,
        designation: designation ?? this.designation,
        image: image ?? this.image,
      );

  factory ProfileGridModel.fromRawJson(String str) =>
      ProfileGridModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileGridModel.fromJson(Map<String, dynamic> json) =>
      ProfileGridModel(
        location: json["location"],
        name: json["name"],
        designation: json["designation"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "name": name,
        "designation": designation,
        "image": image,
      };
}
