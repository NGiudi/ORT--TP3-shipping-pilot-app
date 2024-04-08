class Car {
  String brand;
  String color;
  String licensePlate;
  String model;
  String type;

  Car({
    required this.brand,
    required this.color,
    required this.licensePlate,
    required this.model,
    required this.type,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
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