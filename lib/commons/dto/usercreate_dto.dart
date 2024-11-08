// To parse this JSON data, do
//
//     final userCreate = userCreateFromJson(jsonString);

import 'dart:convert';

UserCreateDto userCreateFromJson(String str) => UserCreateDto.fromJson(json.decode(str));

String userCreateToJson(UserCreateDto data) => json.encode(data.toJson());

class UserCreateDto {
    final String email;
    final String password;
    final String passwordConfirmation;
    final String name;

    UserCreateDto({
        required this.email,
        required this.password,
        required this.passwordConfirmation,
        required this.name,
    });

    factory UserCreateDto.fromJson(Map<String, dynamic> json) => UserCreateDto(
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "name": name,
    };
}
