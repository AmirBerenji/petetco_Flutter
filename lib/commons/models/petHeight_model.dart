// To parse this JSON data, do
//
//     final petHeight = petHeightFromJson(jsonString);

import 'dart:convert';

PetHeight petHeightFromJson(String str) => PetHeight.fromJson(json.decode(str));

String petHeightToJson(PetHeight data) => json.encode(data.toJson());

class PetHeight {
    final int? id;
    final String? label;
    final int? petId;
    final double? height;

    PetHeight({
        this.id,
        this.label,
        this.petId,
        this.height,
    });

    factory PetHeight.fromJson(Map<String, dynamic> json) => PetHeight(
        id: json["id"],
        label: json["label"],
        petId: json["pet_id"],
         height: json["height"] is String
          ? double.parse(json["height"])
          : json["height"] is int
              ? (json["height"] as int).toDouble()
              : json["height"] as double?,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "pet_id": petId,
        "height": height,
    };
}
