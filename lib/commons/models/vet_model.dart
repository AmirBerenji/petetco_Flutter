import 'dart:convert';

Vet vetFromJson(String str) => Vet.fromJson(json.decode(str));

String vetToJson(Vet data) => json.encode(data.toJson());

class Vet {
  final int? id;
  final dynamic cover;
  final String? name;
  final String? description;
  final List<dynamic>? branches;
  final String? createdAt;

  Vet({
    this.id,
    this.cover,
    this.name,
    this.description,
    this.branches,
    this.createdAt,
  });

  factory Vet.fromJson(Map<String, dynamic> json) => Vet(
        id: json["id"],
        cover: json["cover"],
        name: json["name"],
        description: json["description"],
        branches: json["branches"] == null
            ? []
            : List<dynamic>.from(json["branches"]!.map((x) => x)),
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cover": cover,
        "name": name,
        "description": description,
        "branches":
            branches == null ? [] : List<dynamic>.from(branches!.map((x) => x)),
        "created_at": createdAt,
      };
}
