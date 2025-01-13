import 'dart:convert';

import 'package:petetco/commons/models/petWeight_model.dart';

PetWeightListDto petWeightListDtoFromJson(String str) =>
    PetWeightListDto.fromJson(json.decode(str));

String petWeightListDtoToJson(PetWeightListDto data) =>
    json.encode(data.toJson());

class PetWeightListDto {
  final List<PetWeight>? data;

  PetWeightListDto({
    this.data,
  });

  factory PetWeightListDto.fromJson(Map<String, dynamic> json) =>
      PetWeightListDto(
        data: json["data"] == null
            ? []
            : List<PetWeight>.from(
                json["data"]!.map((x) => PetWeight.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
