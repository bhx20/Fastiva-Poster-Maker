// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

List<ProfileData> profileDataFromJson(String str) => List<ProfileData>.from(
    json.decode(str).map((x) => ProfileData.fromJson(x)));
String profileDataToJson(List<ProfileData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileData {
  int? dbId;
  String? dbCreatedAt;
  String? logo;
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? profileType;
  GlobalKey? menuKey;

  ProfileData({
    this.dbId,
    this.dbCreatedAt,
    this.logo,
    this.name,
    this.mobile,
    this.email,
    this.address,
    this.profileType,
    this.menuKey,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        dbId: json["dbId"],
        dbCreatedAt: json["dbCreatedAt"],
        logo: json["logo"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        profileType: json["profileType"],
        menuKey: GlobalKey(),
      );

  Map<String, dynamic> toJson() => {
        "dbId": dbId,
        "dbCreatedAt": dbCreatedAt,
        "logo": logo,
        "name": name,
        "mobile": mobile,
        "email": email,
        "address": address,
        "profileType": profileType,
      };
}
