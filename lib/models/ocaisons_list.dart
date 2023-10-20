// To parse this JSON data, do
//
//     final occasionType = occasionTypeFromJson(jsonString);

import 'dart:convert';

OccasionType occasionTypeFromJson(String str) => OccasionType.fromJson(json.decode(str));

String occasionTypeToJson(OccasionType data) => json.encode(data.toJson());

class OccasionType {
    String? message;
    Data? data;
    Extra? extra;

    OccasionType({
        this.message,
        this.data,
        this.extra,
    });

    factory OccasionType.fromJson(Map<String, dynamic> json) => OccasionType(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        extra: Extra.fromJson(json["extra"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
        "extra": extra!.toJson(),
    };
}

class Data {
    List<OccasionTypeElement> ?occasionTypes;

    Data({
        this.occasionTypes,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        occasionTypes: List<OccasionTypeElement>.from(json["occasion_types"].map((x) => OccasionTypeElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "occasion_types": List<dynamic>.from(occasionTypes!.map((x) => x.toJson())),
    };
}

class OccasionTypeElement {
    int? id;
    String? name;
    String? icon;
    String? banner;
    String? description;
    DateTime? createdAt;
    DateTime? updatedAt;

    OccasionTypeElement({
        this.id,
        this.name,
        this.icon,
        this.banner,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    factory OccasionTypeElement.fromJson(Map<String, dynamic> json) => OccasionTypeElement(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        banner: json["banner"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "banner": banner,
        "description": description,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}

class Extra {
    int? totalCount;
    int? pageNumber;
    int? pageSize;

    Extra({
        this.totalCount,
        this.pageNumber,
        this.pageSize,
    });

    factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        totalCount: json["total_count"],
        pageNumber: json["page_number"],
        pageSize: json["page_size"],
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "page_number": pageNumber,
        "page_size": pageSize,
    };
}
