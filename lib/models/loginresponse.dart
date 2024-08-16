import 'dart:convert';

LoginresponseModel loginresponseModelFromJson(String str) => LoginresponseModel.fromJson(json.decode(str));

String loginresponseModelToJson(LoginresponseModel data) => json.encode(data.toJson());

class LoginresponseModel {
    final String accessToken;
    final String username;
    final String number;
    final String id;

    LoginresponseModel({
        required this.accessToken,
        required this.username,
        required this.number,
        required this.id,
    });

    factory LoginresponseModel.fromJson(Map<String, dynamic> json) => LoginresponseModel(
        accessToken: json["accessToken"],
        username: json["username"],
        number: json["number"],
        id: json["_id"],

    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "username": username,
        "number": number,
        "_id": id,
    };
}