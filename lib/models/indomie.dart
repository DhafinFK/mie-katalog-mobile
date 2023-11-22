// To parse this JSON data, do
//
//     final indomie = indomieFromJson(jsonString);

import 'dart:convert';

List<Indomie> indomieFromJson(String str) =>
    List<Indomie>.from(json.decode(str).map((x) => Indomie.fromJson(x)));

String indomieToJson(List<Indomie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Indomie {
  Model model;
  int pk;
  Fields fields;

  Indomie({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Indomie.fromJson(Map<String, dynamic> json) => Indomie(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int amount;
  String description;
  int price;
  Type type;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.description,
    required this.price,
    required this.type,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        price: json["price"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
        "price": price,
        "type": typeValues.reverse[type],
      };
}

enum Type { MG, MK }

final typeValues = EnumValues({"MG": Type.MG, "MK": Type.MK});

enum Model { MAIN_INDOMIE }

final modelValues = EnumValues({"main.indomie": Model.MAIN_INDOMIE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
