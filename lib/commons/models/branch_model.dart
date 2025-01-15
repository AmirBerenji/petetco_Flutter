import 'dart:convert';

import 'package:petetco/commons/models/vet_model.dart';

Branch branchFromJson(String str) => Branch.fromJson(json.decode(str));

String branchToJson(Branch data) => json.encode(data.toJson());

class Branch {
  final int? id;
  final dynamic cover;
  final int? vetId;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final dynamic description;
  final Vet? vet;
  final String? createdAt;

  Branch({
    this.id,
    this.cover,
    this.vetId,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.description,
    this.vet,
    this.createdAt,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        cover: json["cover"],
        vetId: json["vet_id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        description: json["description"],
        vet: json["vet"] == null ? null : Vet.fromJson(json["vet"]),
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cover": cover,
        "vet_id": vetId,
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "description": description,
        "vet": vet?.toJson(),
        "created_at": createdAt,
      };
}
