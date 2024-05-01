import 'package:shipping_pilot/models/index.dart';

class Visit {
  Client buyer;
  String id;
  List<String> packages;
  int price;
  VisitStats stats;
  String status;

  Visit({
    required this.buyer,
    required this.id,
    required this.packages,
    required this.price,
    required this.stats,
    required this.status,
  });

  factory Visit.fromJson(Map<String, dynamic> json) => Visit(
    buyer: Client.fromJson(json['buyer']),
    id: json['id'],
    packages: List<String>.from(json['packages'].map((x) => x)),
    price: json['price'],
    stats: VisitStats.fromJson(json['stats']),
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    'buyer': buyer.toJson(),
    'id': id,
    'packages': List<dynamic>.from(packages.map((x) => x)),
    'price': price,
    'stats': stats.toJson(),
    'status': status,
  };
}