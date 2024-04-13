import 'package:shipping_pilot/models/models.dart';

class Visit {
  Address address;
  Client buyer;
  DateTime eta;
  List<String> packages;
  int packagesCount;
  int price;
  String status;

  Visit({
    required this.address,
    required this.buyer,
    required this.eta,
    required this.packages,
    required this.packagesCount,
    required this.price,
    required this.status,
  });

  factory Visit.fromJson(Map<String, dynamic> json) => Visit(
    address: Address.fromJson(json["address"]),
    buyer: Client.fromJson(json["buyer"]),
    eta: DateTime.parse(json['eta']),
    packages: List<String>.from(json["packages"].map((x) => x)),
    packagesCount: json["packages_count"],
    price: json["price"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "buyer": buyer.toJson(),
    'eta': eta.toIso8601String(),
    "packages": List<dynamic>.from(packages.map((x) => x)),
    "packages_count": packagesCount,
    "price": price,
    "status": status,
  };

  formattedETA() {
    return '${eta.hour}:${eta.minute}';
  }
}