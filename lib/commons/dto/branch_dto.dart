// To parse this JSON data, do
//
//     final branchDto = branchDtoFromJson(jsonString);

import 'dart:convert';

import '../models/employee_model.dart';
import '../models/vet_model.dart';

BranchDto branchDtoFromJson(String str) => BranchDto.fromJson(json.decode(str));

String branchDtoToJson(BranchDto data) => json.encode(data.toJson());

class BranchDto {
  final Data? data;

  BranchDto({
    this.data,
  });

  factory BranchDto.fromJson(Map<String, dynamic> json) => BranchDto(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final dynamic cover;
  final int? vetId;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final dynamic description;
  final Vet? vet;
  final List<Employee>? employees;
  final String? createdAt;

  Data({
    this.id,
    this.cover,
    this.vetId,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.description,
    this.vet,
    this.employees,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        cover: json["cover"],
        vetId: json["vet_id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        description: json["description"],
        vet: json["vet"] == null ? null : Vet.fromJson(json["vet"]),
        employees: json["employees"] == null
            ? []
            : List<Employee>.from(
                json["employees"]!.map((x) => Employee.fromJson(x))),
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
        "employees": employees == null
            ? []
            : List<dynamic>.from(employees!.map((x) => x.toJson())),
        "created_at": createdAt,
      };
}
