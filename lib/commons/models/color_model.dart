// To parse this JSON data, do
//
//     final color = colorFromJson(jsonString);

import 'dart:convert';

PetColor colorFromJson(String str) => PetColor.fromJson(json.decode(str));

String colorToJson(PetColor data) => json.encode(data.toJson());

class PetColor {
    final int? id;
    final String? name;

    PetColor({
        this.id,
        this.name,
    });

    factory PetColor.fromJson(Map<String, dynamic> json) => PetColor(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
