// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

List<DownLoadData> downloadDataFromJson(String str) => List<DownLoadData>.from(
    json.decode(str).map((x) => DownLoadData.fromJson(x)));

String downloadDataToJson(List<DownLoadData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DownLoadData {
  int? dbId;
  String? dbCreatedAt;
  String? images;
  String addType;

  DownLoadData(
      {this.dbId, this.dbCreatedAt, this.images, this.addType = 'img'});

  factory DownLoadData.fromJson(Map<String, dynamic> json) => DownLoadData(
        dbId: json["dbId"],
        dbCreatedAt: json["dbCreatedAt"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "dbId": dbId,
        "dbCreatedAt": dbCreatedAt,
        "images": images,
      };
}
