// To parse this JSON data, do
//
//     final vetDto = vetDtoFromJson(jsonString);

import 'dart:convert';

import 'package:petetco/commons/models/branch_model.dart';

VetDto vetDtoFromJson(String str) => VetDto.fromJson(json.decode(str));

String vetDtoToJson(VetDto data) => json.encode(data.toJson());

class VetDto {
  final Data? data;

  VetDto({
    this.data,
  });

  factory VetDto.fromJson(Map<String, dynamic> json) => VetDto(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? cover;
  final dynamic logo;
  final String? name;
  final String? description;
  final List<Branch>? branches;
  final String? createdAt;

  Data({
    this.id,
    this.cover,
    this.logo,
    this.name,
    this.description,
    this.branches,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        cover: json["cover"],
        logo: json["logo"],
        name: json["name"],
        description: json["description"],
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"]!.map((x) => Branch.fromJson(x))),
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cover": cover,
        "logo": logo,
        "name": name,
        "description": description,
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "created_at": createdAt,
      };
}
