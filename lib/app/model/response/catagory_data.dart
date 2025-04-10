// To parse this JSON data, do
//
//     final catagoryModel = catagoryModelFromJson(jsonString);

import 'dart:convert';

CatagoryModel catagoryModelFromJson(String str) =>
    CatagoryModel.fromJson(json.decode(str));

String catagoryModelToJson(CatagoryModel data) => json.encode(data.toJson());

class CatagoryModel {
  Result? result;

  CatagoryModel({
    this.result,
  });

  factory CatagoryModel.fromJson(Map<String, dynamic> json) => CatagoryModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class Result {
  String? catId;
  String? catName;
  List<CategoryList>? categoryList;

  Result({
    this.catId,
    this.catName,
    this.categoryList,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        catId: json["catId"],
        catName: json["catName"],
        categoryList: json["categoryList"] == null
            ? []
            : List<CategoryList>.from(
                json["categoryList"]!.map((x) => CategoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "catName": catName,
        "categoryList": categoryList == null
            ? []
            : List<dynamic>.from(categoryList!.map((x) => x.toJson())),
      };
}

class CategoryList {
  int? sortOrder;
  String? catId;
  String? catName;
  String? imgUrl;

  CategoryList({
    this.sortOrder,
    this.catId,
    this.catName,
    this.imgUrl,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        sortOrder: json["sortOrder"],
        catId: json["catId"],
        catName: json["catName"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "sortOrder": sortOrder,
        "catId": catId,
        "catName": catName,
        "imgUrl": imgUrl,
      };
}
