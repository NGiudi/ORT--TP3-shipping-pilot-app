import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

List<Travel> routeFromJson(String str) => List<Travel>.from(json.decode(str).map((x) => Travel.fromJson(x)));

String routeToJson(List<Travel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Travel {
  User driver;
  String id;
  double price;
  TravelStats stats;
  String status;
  Vehicle vehicle;
  List<Visit> visits;

  //? statuses
  static const NEW_STATUS = 'new'; // ignore: constant_identifier_names
  static const IN_PROGRESS_STATUS = 'in_propress'; // ignore: constant_identifier_names
  static const FINISHED_STATUS = 'finished'; // ignore: constant_identifier_names

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
    driver: json['driver'],
    id: json['id'],
    price: json['price'].toDouble(),
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
  
  Travel copyWith({
    User? driver,
    String? id,
    double? price,
    TravelStats? stats,
    String? status,
    Vehicle? vehicle,
    List<Visit>? visits,
  }) {
    return Travel(
      driver: driver ?? this.driver.copyWith(),
      id: id ?? this.id,
      price: price ?? this.price,
      stats: stats ?? this.stats.copyWith(),
      status: status ?? this.status,
      vehicle: vehicle ?? this.vehicle.copyWith(),
      visits: visits ?? List<Visit>.from(this.visits.map((v) => v.copyWith())),
    );
  }

  String currentVisit() {
    Visit? currentVisit;

    for (int i=0; i < visits.length; i++) {
      if (visits[i].status == Visit.IN_PROGRESS_STATUS) {
        currentVisit = visits[i];
        i = visits.length;
      } else if (currentVisit == null && visits[i].status == Visit.NEW_STATUS) {
        currentVisit = visits[i];
      }
    }

    return currentVisit == null ? '' : currentVisit.id;
  }
}