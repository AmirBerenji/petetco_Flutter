// To parse this JSON data, do
//
//     final color = colorFromJson(jsonString);

import 'dart:convert';

Color colorFromJson(String str) => Color.fromJson(json.decode(str));

String colorToJson(Color data) => json.encode(data.toJson());

class Color {
    final int? id;
    final String? name;

    Color({
        this.id,
        this.name,
    });

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
