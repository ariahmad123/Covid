// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    required this.key,
  });

  String key;

  factory City.fromJson(Map<String, dynamic> json) => City(
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
      };

  @override
  String toString() => key;
}
