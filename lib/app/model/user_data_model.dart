// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  String createdAt;
  String updateAt;
  String deviceId;
  String purchaseId;
  String planPurchaseDate;
  String planExpireDate;
  String SKU;

  UserDataModel({
    required this.createdAt,
    required this.updateAt,
    required this.deviceId,
    required this.purchaseId,
    required this.SKU,
    required this.planPurchaseDate,
    required this.planExpireDate,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        createdAt: json["createdAt"],
        updateAt: json["updateAt"],
        deviceId: json["deviceId"],
        purchaseId: json["purchaseId"],
        SKU: json["SKU"],
        planPurchaseDate: json["planPurchaseDate"],
        planExpireDate: json["planExpireDate"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updateAt": updateAt,
        "deviceId": deviceId,
        "purchaseId": purchaseId,
        "SKU": SKU,
        "planPurchaseDate": planPurchaseDate,
        "planExpireDate": planExpireDate,
      };
}
