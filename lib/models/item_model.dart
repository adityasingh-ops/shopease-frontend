import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
    final String id;
    final String title;
    final String time;
    final List<String> foodtags;
    final String category;
    final List<dynamic> foodtype;
    final String code;
    final bool isAvailable;
    final String store;
    final double rating;
    final int ratingCount;
    final String imageUrl;
    final String description;
    final double price;
    final List<Additive> additives;

    ItemModel({
        required this.id,
        required this.title,
        required this.time,
        required this.foodtags,
        required this.category,
        required this.foodtype,
        required this.code,
        required this.isAvailable,
        required this.store,
        required this.rating,
        required this.ratingCount,
        required this.imageUrl,
        required this.description,
        required this.price,
        required this.additives,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        foodtags: List<String>.from(json["foodtags"].map((x) => x)),
        category: json["category"],
        foodtype: List<dynamic>.from(json["foodtype"].map((x) => x)),
        code: json["code"],
        isAvailable: json["isAvailable"],
        store: json["store"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        additives: List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "foodtags": List<dynamic>.from(foodtags.map((x) => x)),
        "category": category,
        "foodtype": List<dynamic>.from(foodtype.map((x) => x)),
        "code": code,
        "isAvailable": isAvailable,
        "store": store,
        "rating": rating,
        "ratingCount": ratingCount,
        "imageUrl": imageUrl,
        "description": description,
        "price": price,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
    };
}

class Additive {
    final int id;
    final String title;
    final String price;

    Additive({
        required this.id,
        required this.title,
        required this.price,
    });

    factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json["id"],
        title: json["title"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
    };
}
