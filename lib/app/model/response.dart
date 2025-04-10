import 'dart:convert';

ResponseObject responseFromJson(String str) => jsonDecode(str);

String responseToJson(ResponseObject data) => json.encode(data.toJson());

class ResponseObject {
  ResponseObject({
    required this.statusCode,
    this.body,
    required this.type,
    this.errorBody,
  });

  int? statusCode;
  String? body;
  String? type;
  String? errorBody;

  factory ResponseObject.fromJson(Map<String, dynamic> json) => ResponseObject(
        statusCode: json["statusCode"],
        body: json["body"],
        type: json["type"],
        errorBody: json["errorBody"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "body": body,
        "type": type,
        "errorBody": errorBody,
      };
}
