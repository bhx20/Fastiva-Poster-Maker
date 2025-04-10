// To parse this JSON data, do
//
//     final homePoster = homePosterFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

HomePoster homePosterFromJson(String str) =>
    HomePoster.fromJson(json.decode(str));

String homePosterToJson(HomePoster data) => json.encode(data.toJson());

class HomePoster {
  Result? result;

  HomePoster({
    this.result,
  });

  factory HomePoster.fromJson(Map<String, dynamic> json) => HomePoster(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class Result {
  List<BannerList>? bannerList;
  List<CategoryList>? categoryList;

  Result({
    this.bannerList,
    this.categoryList,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        bannerList: json["bannerList"] == null
            ? []
            : List<BannerList>.from(
                json["bannerList"]!.map((x) => BannerList.fromJson(x))),
        categoryList: json["categoryList"] == null
            ? []
            : List<CategoryList>.from(
                json["categoryList"]!.map((x) => CategoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bannerList": bannerList == null
            ? []
            : List<dynamic>.from(bannerList!.map((x) => x.toJson())),
        "categoryList": categoryList == null
            ? []
            : List<dynamic>.from(categoryList!.map((x) => x.toJson())),
      };
}

class BannerList {
  String? catId;
  int? sortOrder;
  String? imgUrl;

  BannerList({
    this.catId,
    this.sortOrder,
    this.imgUrl,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        catId: json["catId"],
        sortOrder: json["sortOrder"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "sortOrder": sortOrder,
        "imgUrl": imgUrl,
      };
}

class CategoryList {
  String? catId;
  String? catName;
  List<String>? tag;
  int? sortOrder;
  List<PosterList>? posterList;
  String addType;

  CategoryList({
    this.catId,
    this.catName,
    this.tag,
    this.sortOrder,
    this.posterList,
    this.addType = 'img',
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        catId: json["catId"],
        catName: json["catName"],
        tag: json["tag"] == null
            ? []
            : List<String>.from(json["tag"]!.map((x) => x)),
        sortOrder: json["sortOrder"],
        posterList: json["posterList"] == null
            ? []
            : List<PosterList>.from(
                json["posterList"]!.map((x) => PosterList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "catName": catName,
        "tag": tag == null ? [] : List<dynamic>.from(tag!.map((x) => x)),
        "sortOrder": sortOrder,
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
