// To parse this JSON data, do
//
//     final petKind = petKindFromJson(jsonString);

import 'dart:convert';

PetKind petKindFromJson(String str) => PetKind.fromJson(json.decode(str));

String petKindToJson(PetKind data) => json.encode(data.toJson());

class PetKind {
    final int? id;
    final String? name;

    PetKind({
        this.id,
        this.name,
    });

    factory PetKind.fromJson(Map<String, dynamic> json) => PetKind(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
