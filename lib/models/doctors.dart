import 'dart:convert';

List<DoctorModel> doctorModelFromJson(String str) => List<DoctorModel>.from(json.decode(str).map((x) => DoctorModel.fromJson(x)));

String doctorModelToJson(List<DoctorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorModel {
    final String id;
    final String image;
    final String name;
    final String title;
    final String price;
    final String address;
    final String patients;
    final String experience;
    final String certificate;
    final String description;
    final int tell;
    final int v;

    DoctorModel({
        required this.id,
        required this.image,
        required this.name,
        required this.title,
        required this.price,
        required this.address,
        required this.patients,
        required this.experience,
        required this.certificate,
        required this.description,
        required this.tell,
        required this.v,
    });

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json["_id"],
        image: json["image"],
        name: json["name"],
        title: json["title"],
        price: json["price"],
        address: json["address"],
        patients: json["patients"],
        experience: json["experience"],
        certificate: json["certificate"],
        description: json["description"],
        tell: json["tell"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "name": name,
        "title": title,
        "price": price,
        "address": address,
        "patients": patients,
        "experience": experience,
        "certificate": certificate,
        "description": description,
        "tell": tell,
        "__v": v,
    };
}