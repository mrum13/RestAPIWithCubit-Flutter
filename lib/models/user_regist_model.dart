// To parse this JSON data, do
//
//     final userRegistModel = userRegistModelFromJson(jsonString);

import 'dart:convert';

UserRegistModel userRegistModelFromJson(String str) =>
    UserRegistModel.fromJson(json.decode(str));

String userRegistModelToJson(UserRegistModel data) =>
    json.encode(data.toJson());

class UserRegistModel {
  UserRegistModel({
    required this.name,
    required this.job,
    required this.id,
    this.createdAt,
  });

  String name;
  String job;
  String id;
  String? createdAt;

  factory UserRegistModel.fromJson(Map<String, dynamic> json) =>
      UserRegistModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt,
      };
}
