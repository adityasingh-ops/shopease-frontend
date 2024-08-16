import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final String number;
    final String username;

    LoginModel({
        required this.number,
        required this.username,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        number: json["number"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "username": username,
    };
}
