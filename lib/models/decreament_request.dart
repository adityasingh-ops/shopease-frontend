import 'dart:convert';

DecreamentRequest decreamentRequestFromJson(String str) => DecreamentRequest.fromJson(json.decode(str));

String decreamentRequestToJson(DecreamentRequest data) => json.encode(data.toJson());

class DecreamentRequest {
    final String userId;
    final String productId;

    DecreamentRequest({
        required this.userId,
        required this.productId,
    });

    factory DecreamentRequest.fromJson(Map<String, dynamic> json) => DecreamentRequest(
        userId: json["userId"],
        productId: json["productId"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "productId": productId,
    };
}
