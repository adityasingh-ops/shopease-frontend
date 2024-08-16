import 'dart:convert';

List<CartResponse> cartResponseFromJson(String str) => List<CartResponse>.from(json.decode(str).map((x) => CartResponse.fromJson(x)));

String cartResponseToJson(List<CartResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartResponse {
    final String id;
    final ProductId productId;
    final int quantity;
    final double totalprice;

    CartResponse({
        required this.id,
        required this.productId,
        required this.quantity,
        required this.totalprice,
    });

    factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        id: json["_id"],
        productId: ProductId.fromJson(json["productId"]),
        quantity: json["quantity"],
        totalprice: json["totalprice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productId": productId.toJson(),
        "quantity": quantity,
        "totalprice": totalprice,
    };
}

class ProductId {
    final String id;
    final String title;
    final String store;
    final double rating;
    final int ratingCount;
    final String imageUrl;
    final String description;
    final double price;

    ProductId({
        required this.id,
        required this.title,
        required this.store,
        required this.rating,
        required this.ratingCount,
        required this.imageUrl,
        required this.description,
        required this.price,
    });

    factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        title: json["title"],
        store: json["store"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "store": store,
        "rating": rating,
        "ratingCount": ratingCount,
        "imageUrl": imageUrl,
        "description": description,
        "price": price,
    };
}
