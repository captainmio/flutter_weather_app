// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

List<Location> locationFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        code: json["Key"],
        name:
            '${json["LocalizedName"]}, ${json["AdministrativeArea"]["LocalizedName"]}, ${json["Country"]["LocalizedName"]}',
      );

  Map<String, dynamic> toJson() => {
        "Key": code,
        "LocalizedName": name,
      };
}
