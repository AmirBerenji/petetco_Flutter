// To parse this JSON data, do
//
//     final breedList = breedListFromJson(jsonString);

import 'dart:convert';

import 'package:petetco/commons/models/petbreed_mode.dart';

BreedList breedListFromJson(String str) => BreedList.fromJson(json.decode(str));

String breedListToJson(BreedList data) => json.encode(data.toJson());

class BreedList {
    final List<PetBreed>? data;

    BreedList({
        this.data,
    });

    factory BreedList.fromJson(Map<String, dynamic> json) => BreedList(
        data: json["data"] == null ? [] : List<PetBreed>.from(json["data"]!.map((x) => PetBreed.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

