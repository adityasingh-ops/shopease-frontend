import 'dart:convert';

Decreament decreamentFromJson(String str) => Decreament.fromJson(json.decode(str));

String decreamentToJson(Decreament data) => json.encode(data.toJson());

class Decreament {
    final String userId;
    final String productId;

    Decreament({
        required this.userId,
        required this.productId,
    });

    factory Decreament.fromJson(Map<String, dynamic> json) => Decreament(
        userId: json["userId"],
        productId: json["productId"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "productId": productId,
    };
}
