// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
    Data? data;
    String? message;

    UserInfo({
        this.data,
        this.message,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
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

    Data({
        this.id,
        this.name,
        this.avatar,
        this.email,
        this.phone,
        this.emailVerified,
        this.address,
        this.addressLocation,
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
