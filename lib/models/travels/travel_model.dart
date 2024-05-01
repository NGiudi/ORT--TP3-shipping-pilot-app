import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

List<Travel> routeFromJson(String str) => List<Travel>.from(json.decode(str).map((x) => Travel.fromJson(x)));

String routeToJson(List<Travel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Travel {
  User driver;
  String id;
  int price;
  TravelStats stats;
  String status;
  Vehicle vehicle;
  List<Visit> visits;

  Travel({
    required this.driver,
    required this.id,
    required this.price,
    required this.stats,
    required this.status,
    required this.vehicle,
    required this.visits,
  });

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
    driver: User.fromJson(json['driver']),
    id: json['id'],
    price: json['price'],
    stats: TravelStats.fromJson(json['stats']),
    status: json['status'],
    vehicle: Vehicle.fromJson(json['vehicle']),
    visits: List<Visit>.from(json['visits'].map((x) => Visit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'driver': driver.toJson(),
    'id': id,
    'price': price,
    'stats': stats.toJson(),
    'status': status,
    'vehicle': vehicle.toJson(),
    'visits': List<dynamic>.from(visits.map((x) => x.toJson())),
  };

  String currentVisit() {
    Visit? currentVisit;

    for (int i=0; i < visits.length; i++) {
      if (visits[i].status == 'in_progress') {
        currentVisit = visits[i];
        i = visits.length;
      } else if (currentVisit == null && visits[i].status == 'new') {
        currentVisit = visits[i];
      }
    }

    return currentVisit == null ? '' : currentVisit.id;
  }
}







