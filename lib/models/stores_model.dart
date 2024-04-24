import 'dart:convert';

List<StoreModel> storeModelFromJson(String str) => List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
    final String id;
    final String title;
    final String type;
    final String time;
    final String imageUrl;
    final List<dynamic> foods;
    final bool pickup;
    final bool delivery;
    final String owner;
    final String code;
    final String logoUrl;
    final int rating;
    final int ratingCount;
    final String verification;
    final String verificationmessage;
    final Coords coords;
     bool ? isAvailable;

    StoreModel({
        required this.id,
        required this.title,
        required this.type,
        required this.time,
        required this.imageUrl,
        required this.foods,
        required this.pickup,
        required this.delivery,
        required this.owner,
        required this.code,
        required this.logoUrl,
        required this.rating,
        required this.ratingCount,
        required this.verification,
        required this.verificationmessage,
        required this.coords,
        this.isAvailable,
    });

    factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["_id"],
        title: json["title"],
        type: json["type"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        foods: List<dynamic>.from(json["foods"].map((x) => x)),
        pickup: json["pickup"],
        delivery: json["delivery"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        verificationmessage: json["verificationmessage"],
        coords: Coords.fromJson(json["coords"]),
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "type": type,
        "time": time,
        "imageUrl": imageUrl,
        "foods": List<dynamic>.from(foods.map((x) => x)),
        "pickup": pickup,
        "delivery": delivery,
        "owner": owner,
        "code": code,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "verification": verification,
        "verificationmessage": verificationmessage,
        "coords": coords.toJson(),
        "isAvailable": isAvailable,
    };
}

class Coords {
    final String id;
    final double lat;
    final double long;
    final String address;
    final String title;
    final double latdelta;
    final double longdelta;

    Coords({
        required this.id,
        required this.lat,
        required this.long,
        required this.address,
        required this.title,
        required this.latdelta,
        required this.longdelta,
    });

    factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        id: json["id"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        address: json["address"],
        title: json["title"],
        latdelta: json["latdelta"]?.toDouble(),
        longdelta: json["longdelta"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "long": long,
        "address": address,
        "title": title,
        "latdelta": latdelta,
        "longdelta": longdelta,
    };
}
