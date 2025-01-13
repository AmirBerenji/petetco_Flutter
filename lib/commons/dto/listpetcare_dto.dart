
import 'dart:convert';

import 'package:petetco/commons/models/petcare_model.dart';

ListPetCareDto listPetCareDtoFromJson(String str) => ListPetCareDto.fromJson(json.decode(str));

String listPetCareDtoToJson(ListPetCareDto data) => json.encode(data.toJson());

class ListPetCareDto {
    List<PetCare>? data;

    ListPetCareDto({
        this.data,
    });

    factory ListPetCareDto.fromJson(Map<String, dynamic> json) => ListPetCareDto(
        data: json["data"] == null ? [] : List<PetCare>.from(json["data"]!.map((x) => PetCare.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}
