// To parse this JSON data, do
//
//     final userCreate = userCreateFromJson(jsonString);

import 'dart:convert';

UserCreate userCreateFromJson(String str) => UserCreate.fromJson(json.decode(str));

String userCreateToJson(UserCreate data) => json.encode(data.toJson());

class UserCreate {
    final String email;
    final String password;
    final String passwordConfirmation;
    final String name;

    UserCreate({
        required this.email,
        required this.password,
        required this.passwordConfirmation,
        required this.name,
    });

    factory UserCreate.fromJson(Map<String, dynamic> json) => UserCreate(
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
