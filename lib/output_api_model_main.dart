// To parse this JSON data, do
//
//     final getResultClass = getResultClassFromJson(jsonString);

import 'dart:convert';

List<GetResultClass> getResultClassFromJson(String str) =>
    List<GetResultClass>.from(
        json.decode(str).map((x) => GetResultClass.fromJson(x)));

String getResultClassToJson(List<GetResultClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetResultClass {
  GetResultClass({
    this.id,
    this.name,
    this.price,
    this.items,
    this.date,
  });

  int? id;
  String? name;
  double? price;
  String? items;
  DateTime? date;

  factory GetResultClass.fromJson(Map<String, dynamic> json) => GetResultClass(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        items: json["items"] == null ? null : json["items"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "items": items == null ? null : items,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}
