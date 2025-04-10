// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

List<LikesData> likesDataFromJson(String str) =>
    List<LikesData>.from(json.decode(str).map((x) => LikesData.fromJson(x)));

String likesDataToJson(List<LikesData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LikesData {
  int? dbId;
  String? dbCreatedAt;
  String? images;
  String? isPremium;

  LikesData({this.dbId, this.dbCreatedAt, this.images, this.isPremium});

  factory LikesData.fromJson(Map<String, dynamic> json) => LikesData(
        dbId: json["dbId"],
        dbCreatedAt: json["dbCreatedAt"],
        images: json["images"],
        isPremium: json["isPremium"],
      );

  Map<String, dynamic> toJson() => {
        "dbId": dbId,
        "dbCreatedAt": dbCreatedAt,
        "images": images,
        "isPremium": isPremium,
      };
}
