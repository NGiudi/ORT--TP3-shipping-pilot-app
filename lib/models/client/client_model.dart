import 'package:shipping_pilot/models/index.dart';

class Client {
  Address address;
  int docNumber;
  String lastName;
  String name;
  String phone;

  Client({
    required this.address,
    required this.docNumber,
    required this.lastName,
    required this.name,
    required this.phone,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        address: Address.fromJson(json['address']),
        docNumber: json['doc_number'],
        lastName: json['last_name'],
        name: json['name'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'address': address.toJson(),
        'doc_number': docNumber,
        'last_name': lastName,
        'name': name,
        'phone': phone,
      };

  Client copyWith({
    Address? address,
    int? docNumber,
    String? lastName,
    String? name,
    String? phone,
  }) {
    return Client(
      address: address ?? this.address.copyWith(),
      docNumber: docNumber ?? this.docNumber,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  String fullName() {
    return '$name $lastName';
  }
}
