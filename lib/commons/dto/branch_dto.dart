import 'dart:convert';

import 'package:petetco/commons/models/vet_model.dart';

BranchDto branchDtoFromJson(String str) => BranchDto.fromJson(json.decode(str));

String branchDtoToJson(BranchDto data) => json.encode(data.toJson());

class BranchDto {
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

  BranchDto({
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

  factory BranchDto.fromJson(Map<String, dynamic> json) => BranchDto(
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
