// To parse this JSON data, do
//
//     final homeSlider = homeSliderFromJson(jsonString);

import 'dart:convert';

HomeSlider homeSliderFromJson(String str) =>
    HomeSlider.fromJson(json.decode(str));

String homeSliderToJson(HomeSlider data) => json.encode(data.toJson());

class HomeSlider {
  List<BannerList>? bannerList;

  HomeSlider({
    this.bannerList,
  });

  factory HomeSlider.fromJson(Map<String, dynamic> json) => HomeSlider(
        bannerList: json["bannerList"] == null
            ? []
            : List<BannerList>.from(
                json["bannerList"]!.map((x) => BannerList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bannerList": bannerList == null
            ? []
            : List<dynamic>.from(bannerList!.map((x) => x.toJson())),
      };
}

class BannerList {
  String? catId;
  String? catName;
  int? sortOrder;
  String? imgUrl;

  BannerList({
    this.catId,
    this.catName,
    this.sortOrder,
    this.imgUrl,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        catId: json["catId"],
        catName: json["catName"],
        sortOrder: json["sortOrder"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "catName": catName,
        "sortOrder": sortOrder,
        "imgUrl": imgUrl,
      };
}
