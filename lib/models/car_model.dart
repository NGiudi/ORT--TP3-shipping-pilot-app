class Vehicle {
  String brand;
  String color;
  String licensePlate;
  String model;
  String type;

  Vehicle({
    required this.brand,
    required this.color,
    required this.licensePlate,
    required this.model,
    required this.type,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    brand: json["brand"],
    color: json["color"],
    licensePlate: json["license_plate"],
    model: json["model"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "color": color,
    "license_plate": licensePlate,
    "model": model,
    "type": type,
  };
}