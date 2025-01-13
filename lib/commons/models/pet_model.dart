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
  final PetColor? color;
  final String? dob;
  final dynamic passportNumber;
  final dynamic chipsetNumber;
  final String? gender;
  final String? cover;
  final double? weight;
  final double? height;

  Pet(
      {this.id,
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
      this.weight,
      this.height});

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
      id: json["id"],
      name: json["name"],
      uuid: json["uuid"],
      userId: json["user_id"],
      breed: json["breed"] == null ? null : PetBreed.fromJson(json["breed"]),
      color: json["color"] == null ? null : PetColor.fromJson(json["color"]),
      dob: json["dob"],
      passportNumber: json["passport_number"],
      chipsetNumber: json["chipset_number"],
      gender: json["gender"],
      cover: json["cover"],
      weight: json["weight"] is String
          ? double.parse(json["weight"])
          : json["weight"] is int
              ? (json["weight"] as int).toDouble()
              : json["weight"] as double?,
      height: json["height"] is String
          ? double.parse(json["height"])
          : json["height"] is int
              ? (json["height"] as int).toDouble()
              : json["height"] as double?);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "uuid": uuid,
        "user_id": userId,
        "breed": breed?.toJson(),
        "color": color?.toJson(),
        "dob": dob,
        "passport_number": passportNumber,
        "chipset_number": chipsetNumber,
        "gender": gender,
        "cover": cover,
        "weight": weight,
        "height": height
      };
}
