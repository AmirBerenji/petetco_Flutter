// To parse this JSON data, do
//
//     final petWeightListDto = petWeightListDtoFromJson(jsonString);

import 'dart:convert';

import 'package:petetco/commons/models/petHeight_model.dart';

PetHeightListDto petHeightListDtoFromJson(String str) => PetHeightListDto.fromJson(json.decode(str));

String petHeightListDtoToJson(PetHeightListDto data) => json.encode(data.toJson());

class PetHeightListDto {
    final List<PetHeight>? data;

    PetHeightListDto({
        this.data,
    });

    factory PetHeightListDto.fromJson(Map<String, dynamic> json) => PetHeightListDto(
        data: json["data"] == null ? [] : List<PetHeight>.from(json["data"]!.map((x) => PetHeight.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}


