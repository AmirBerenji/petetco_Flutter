// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
    Data? data;
    String? message;

    UserLogin({
        this.data,
        this.message,
    });

    factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
    };
}

class Data {
    int? id;
    String? name;
    String? avatar;
    String? email;
    String? phone;
    bool? emailVerified;
    String? address;
    AddressLocation? addressLocation;
    String? token;

    Data({
        this.id,
        this.name,
        this.avatar,
        this.email,
        this.phone,
        this.emailVerified,
        this.address,
        this.addressLocation,
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        phone: json["phone"],
        emailVerified: json["email_verified"],
        address: json["address"],
        addressLocation: json["address_location"] == null ? null : AddressLocation.fromJson(json["address_location"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "email": email,
        "phone": phone,
        "email_verified": emailVerified,
        "address": address,
        "address_location": addressLocation?.toJson(),
        "token": token,
    };
}

class AddressLocation {
    double? lat;
    double? lng;

    AddressLocation({
        this.lat,
        this.lng,
    });

    factory AddressLocation.fromJson(Map<String, dynamic> json) => AddressLocation(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}
