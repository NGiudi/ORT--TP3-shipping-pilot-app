import 'dart:convert';

import 'package:shipping_pilot/models/models.dart';

List<Travel> routeFromJson(String str) => List<Travel>.from(json.decode(str).map((x) => Travel.fromJson(x)));

String routeToJson(List<Travel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Travel {
  Car car;
  Person driver;
  int price;
  String status;
  List<Visit> visits;

  Travel({
    required this.car,
    required this.driver,
    required this.price,
    required this.status,
    required this.visits,
  });

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
    car: Car.fromJson(json["car"]),
    driver: Person.fromJson(json["driver"]),
    price: json["price"],
    status: json["status"],
    visits: List<Visit>.from(json["visits"].map((x) => Visit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "car": car.toJson(),
    "driver": driver.toJson(),
    "price": price,
    "status": status,
    "visits": List<dynamic>.from(visits.map((x) => x.toJson())),
  };
}







