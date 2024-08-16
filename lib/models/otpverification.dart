import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    final String otp;
    final String number;
    final String username;

    OtpModel({
        required this.otp,
        required this.number,
        required this.username,
    });

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        otp: json["otp"],
        number: json["number"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
        "number": number,
        "username": username,
    };
}
