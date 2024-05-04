import 'package:shipping_pilot/models/index.dart';

class Visit {
  Client buyer;
  String id;
  List<String> packages;
  int price;
  VisitStats stats;
  String status;

  //? statuses
  static const NEW_STATUS = 'new'; // ignore: constant_identifier_names
  static const FAILED_STATUS = 'failed'; // ignore: constant_identifier_names
  static const IN_PROGRESS_STATUS = 'in_propress'; // ignore: constant_identifier_names
  static const SUCCESSFUL_STATUS = 'successful'; // ignore: constant_identifier_names

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

  Visit copyWith({
    Client? buyer,
    String? id,
    List<String>? packages,
    int? price,
    VisitStats? stats,
    String? status,
  }) {
    return Visit(
      buyer: buyer ?? this.buyer.copyWith(),
      id: id ?? this.id,
      packages: packages ?? List<String>.from(this.packages),
      price: price ?? this.price,
      stats: stats ?? this.stats.copyWith(),
      status: status ?? this.status,
    );
  }
  
  String getIndex() {
    List<String> parts = id.split("-");

    if (parts.length < 3) {
      return '';
    }

    return '${int.parse(parts[2]) - 1}';
  }
}