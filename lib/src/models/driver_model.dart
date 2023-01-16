import 'dart:convert';

List<Driver> employeeFromJson(String str) =>
    List<Driver>.from(json.decode(str).map((x) => Driver.fromJson(x)));

String employeeToJson(List<Driver> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Driver {
  String? name;
  String? age;
  String? wins;
  String? id;

  Driver({
    this.name,
    this.age,
    this.wins,
    this.id,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        name: json["name"],
        age: json["age"],
        wins: json["wins"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "wins": wins,
        "id": id,
      };
}
