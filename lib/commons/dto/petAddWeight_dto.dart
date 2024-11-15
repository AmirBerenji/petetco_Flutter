// To parse this JSON data, do
//
//     final petWeightAddDto = petWeightAddDtoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PetWeightAddDto petWeightAddDtoFromJson(String str) => PetWeightAddDto.fromJson(json.decode(str));

String petWeightAddDtoToJson(PetWeightAddDto data) => json.encode(data.toJson());

class PetWeightAddDto {
    final int petId;
    final String date;
    final double weight;

    PetWeightAddDto({
        required this.petId,
        required this.date,
        required this.weight,
    });

    factory PetWeightAddDto.fromJson(Map<String, dynamic> json) => PetWeightAddDto(
        petId: json["pet_id"],
        date: json["date"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "pet_id": petId,
        "date": date, 
        "weight": weight,
    };
}
