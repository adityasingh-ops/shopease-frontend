import 'dart:convert';

CartRequest cartRequestFromJson(String str) => CartRequest.fromJson(json.decode(str));

String cartRequestToJson(CartRequest data) => json.encode(data.toJson());

class CartRequest {
    final String productId;
    final int quantity;
    final double totalprice;

    CartRequest({
        required this.productId,
        required this.quantity,
        required this.totalprice,
    });

    factory CartRequest.fromJson(Map<String, dynamic> json) => CartRequest(
        productId: json["productId"],
        quantity: json["quantity"],
        totalprice: json["totalprice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "totalprice": totalprice,
    };
}
