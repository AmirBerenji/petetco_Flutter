// To parse this JSON data, do
//
//     final petWeight = petWeightFromJson(jsonString);

import 'dart:convert';

PetWeight petWeightFromJson(String str) => PetWeight.fromJson(json.decode(str));

String petWeightToJson(PetWeight data) => json.encode(data.toJson());

class PetWeight {
    final int? id;
    final DateTime? date;
    final int? petId;
    final int? weight;

    PetWeight({
        this.id,
        this.date,
        this.petId,
        this.weight,
    });

    factory PetWeight.fromJson(Map<String, dynamic> json) => PetWeight(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        petId: json["pet_id"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "pet_id": petId,
        "weight": weight,
    };
}
