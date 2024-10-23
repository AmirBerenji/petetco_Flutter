// To parse this JSON data, do
//
//     final pet = petFromJson(jsonString);

import 'dart:convert';

import 'package:petetco/commons/models/color_model.dart';
import 'package:petetco/commons/models/petbreed_mode.dart';

Pet petFromJson(String str) => Pet.fromJson(json.decode(str));

String petToJson(Pet data) => json.encode(data.toJson());

class Pet {
    final int? id;
    final String? name;
    final String? uuid;
    final int? userId;
    final PetBreed? breed;
    final Color? color;
    final DateTime? dob;
    final dynamic passportNumber;
    final dynamic chipsetNumber;
    final String? gender;
    final String? cover;

    Pet({
        this.id,
        this.name,
        this.uuid,
        this.userId,
        this.breed,
        this.color,
        this.dob,
        this.passportNumber,
        this.chipsetNumber,
        this.gender,
        this.cover,
    });

    factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"],
        name: json["name"],
        uuid: json["uuid"],
        userId: json["user_id"],
        breed: json["breed"] == null ? null : PetBreed.fromJson(json["breed"]),
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        passportNumber: json["passport_number"],
        chipsetNumber: json["chipset_number"],
        gender: json["gender"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "uuid": uuid,
        "user_id": userId,
        "breed": breed?.toJson(),
        "color": color?.toJson(),
        "dob": dob?.toIso8601String(),
        "passport_number": passportNumber,
        "chipset_number": chipsetNumber,
        "gender": gender,
        "cover": cover,
    };
}


