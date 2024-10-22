
import 'dart:convert';

PetList petListFromJson(String str) => PetList.fromJson(json.decode(str));

String petListToJson(PetList data) => json.encode(data.toJson());

class PetList {
    List<Datum>? data;
    Pagination? pagination;
    String? message;

    PetList({
        this.data,
        this.pagination,
        this.message,
    });

    factory PetList.fromJson(Map<String, dynamic> json) => PetList(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
        "message": message,
    };
}

class Datum {
    final int? id;
    final String? name;
    final String? uuid;
    final int? userId;
    final Breed? breed;
    final Breed? color;
    final DateTime? dob;
    final String? passportNumber;
    final String? chipsetNumber;
    final String? gender;
    final String? cover;

    Datum({
        this.id,
        this.name,
        this.uuid,
        this.userId,
        this.breed,
        this.color,
        this.dob,
        this.passportNumber,
        this.chipsetNumber,
        this.gender,
        this.cover,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        uuid: json["uuid"],
        userId: json["user_id"],
        breed: json["breed"] == null ? null : Breed.fromJson(json["breed"]),
        color: json["color"] == null ? null : Breed.fromJson(json["color"]),
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        passportNumber: json["passport_number"],
        chipsetNumber: json["chipset_number"],
        gender: json["gender"],
        cover: json["cover"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "uuid": uuid,
        "user_id": userId,
        "breed": breed?.toJson(),
        "color": color?.toJson(),
        "dob": dob?.toIso8601String(),
        "passport_number": passportNumber,
        "chipset_number": chipsetNumber,
        "gender": gender,
        "cover": cover,
    };
}

class Breed {
    final int? id;
    final String? name;

    Breed({
        this.id,
        this.name,
    });

    factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Pagination {
    final int? currentPage;
    final String? firstPageUrl;
    final int? from;
    final int? lastPage;
    final String? lastPageUrl;
    final List<Link>? links;
    final dynamic nextPageUrl;
    final String? path;
    final int? perPage;
    final dynamic prevPageUrl;
    final int? to;
    final int? total;

    Pagination({
        this.currentPage,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Link {
    final String? url;
    final String? label;
    final bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
