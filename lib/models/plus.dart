// To parse this JSON data, do
//
//     final plus = plusFromJson(jsonString);

import 'dart:convert';

Plus plusFromJson(String str) => Plus.fromJson(json.decode(str));

String plusToJson(Plus data) => json.encode(data.toJson());

class Plus {
  Plus({
    required this.tanggal,
  });

  int tanggal;

  factory Plus.fromJson(Map<String, dynamic> json) => Plus(
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
      };
}
