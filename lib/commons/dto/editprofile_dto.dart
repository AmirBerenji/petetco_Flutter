import 'dart:convert';

EditProfileDto editProfileDtoFromJson(String str) =>
    EditProfileDto.fromJson(json.decode(str));

String editProfileDtoToJson(EditProfileDto data) => json.encode(data.toJson());

class EditProfileDto {
  final String? name;
  final AddressLocation? addressLocation;
  final String? address;
  final String? phone;

  EditProfileDto({
    this.name,
    this.addressLocation,
    this.address,
    this.phone,
  });

  factory EditProfileDto.fromJson(Map<String, dynamic> json) => EditProfileDto(
        name: json["name"],
        addressLocation: json["address_location"] == null
            ? null
            : AddressLocation.fromJson(json["address_location"]),
        address: json["address"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address_location": addressLocation?.toJson(),
        "address": address,
        "phone": phone,
      };
}

class AddressLocation {
  final double? lat;
  final double? lng;

  AddressLocation({
    this.lat,
    this.lng,
  });

  factory AddressLocation.fromJson(Map<String, dynamic> json) =>
      AddressLocation(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
