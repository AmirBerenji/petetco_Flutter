// To parse this JSON data, do
//
//     final petBreed = petBreedFromJson(jsonString);

import 'dart:convert';

import 'package:petetco/commons/models/petkind_model.dart';

PetBreed petBreedFromJson(String str) => PetBreed.fromJson(json.decode(str));

String petBreedToJson(PetBreed data) => json.encode(data.toJson());

class PetBreed {
    final int? id;
    final String? name;
    final PetKind? kind;

    PetBreed({
        this.id,
        this.name,
        this.kind,
    });

    factory PetBreed.fromJson(Map<String, dynamic> json) => PetBreed(
        id: json["id"],
        name: json["name"],
        kind: json["kind"] == null ? null : PetKind.fromJson(json["kind"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "kind": kind?.toJson(),
    };
}

