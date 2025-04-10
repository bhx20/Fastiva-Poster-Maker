// To parse this JSON data, do
//
//     final posterDetails = posterDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

PosterDetails posterDetailsFromJson(String str) =>
    PosterDetails.fromJson(json.decode(str));

String posterDetailsToJson(PosterDetails data) => json.encode(data.toJson());

class PosterDetails {
  Result? result;

  PosterDetails({
    this.result,
  });

  factory PosterDetails.fromJson(Map<String, dynamic> json) => PosterDetails(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class Result {
  String? catId;
  String? catName;
  List<PosterList>? posterList;

  Result({
    this.catId,
    this.catName,
    this.posterList,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        catId: json["catId"],
        catName: json["catName"],
        posterList: json["posterList"] == null
            ? []
            : List<PosterList>.from(
                json["posterList"]!.map((x) => PosterList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "catName": catName,
        "posterList": posterList == null
            ? []
            : List<dynamic>.from(posterList!.map((x) => x.toJson())),
      };
}

class PosterList {
  int? sortOrder;
  String? imgUrl;
  int? isPremium;
  RxBool? isLiked;

  PosterList({
    this.sortOrder,
    this.imgUrl,
    this.isPremium,
    this.isLiked,
  });

  factory PosterList.fromJson(Map<String, dynamic> json) => PosterList(
        sortOrder: json["sortOrder"],
        imgUrl: json["imgUrl"],
        isPremium: json["isPremium"],
        isLiked: false.obs,
      );

  Map<String, dynamic> toJson() => {
        "sortOrder": sortOrder,
        "imgUrl": imgUrl,
        "isPremium": isPremium,
      };
}
