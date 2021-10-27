// To parse this JSON data,do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.id,
    required this.name,
    required this.price,
    required this.date,
    required this.items,
  });

  int id;
  String name;
  double price;
  DateTime date;
  String items;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        date: DateTime.parse(json["date"]),
        items: json["items"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "items": items,
      };
}
