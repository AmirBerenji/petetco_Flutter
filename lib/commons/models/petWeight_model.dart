// To parse this JSON data, do
//
//     final petWeight = petWeightFromJson(jsonString);

import 'dart:convert';

PetWeight petWeightFromJson(String str) => PetWeight.fromJson(json.decode(str));

String petWeightToJson(PetWeight data) => json.encode(data.toJson());

class PetWeight {
    final int? id;
    final String? label;
    final int? petId;
    final double? weight;

    PetWeight({
        this.id,
        this.label,
        this.petId,
        this.weight,
    });

    factory PetWeight.fromJson(Map<String, dynamic> json) => PetWeight(
        id: json["id"],
        label: json["label"],
        petId: json["pet_id"],
         weight: json["weight"] is String
          ? double.parse(json["weight"])
          : json["weight"] is int
              ? (json["weight"] as int).toDouble()
              : json["weight"] as double?,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "pet_id": petId,
        "weight": weight,
    };
}
