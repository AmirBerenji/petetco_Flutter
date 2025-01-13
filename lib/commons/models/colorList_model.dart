// To parse this JSON data, do
//
//     final colorList = colorListFromJson(jsonString);

import 'dart:convert';

import 'package:petetco/commons/models/color_model.dart';

ColorList colorListFromJson(String str) => ColorList.fromJson(json.decode(str));

String colorListToJson(ColorList data) => json.encode(data.toJson());

class ColorList {
    final List<PetColor>? data;

    ColorList({
        this.data,
    });

    factory ColorList.fromJson(Map<String, dynamic> json) => ColorList(
        data: json["data"] == null ? [] : List<PetColor>.from(json["data"]!.map((x) => PetColor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

