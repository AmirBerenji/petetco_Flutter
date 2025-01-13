// To parse this JSON data, do
//
//     final petCare = petCareFromJson(jsonString);

import 'dart:convert';

PetCare petCareFromJson(String str) => PetCare.fromJson(json.decode(str));

String petCareToJson(PetCare data) => json.encode(data.toJson());

class PetCare {
    int? id;
    String? name;
    String? cover;

    PetCare({
        this.id,
        this.name,
        this.cover,
    });

    factory PetCare.fromJson(Map<String, dynamic> json) => PetCare(
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover": cover,
    };
}
