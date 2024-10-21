
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
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
    };
}

class Data {
    final int? id;
    final String? name;
    final String? avatar;
    final String? email;
    final String? phone;
    final bool? emailVerified;
    final String? address;
    final double? lng;
    final double? lat;

    Data({
        this.id,
        this.name,
        this.avatar,
        this.email,
        this.phone,
        this.emailVerified,
        this.address,
        this.lng,
        this.lat,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        phone: json["phone"],
        emailVerified: json["email_verified"],
        address: json["address"],
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "email": email,
        "phone": phone,
        "email_verified": emailVerified,
        "address": address,
        "lng": lng,
        "lat": lat,
    };
}
