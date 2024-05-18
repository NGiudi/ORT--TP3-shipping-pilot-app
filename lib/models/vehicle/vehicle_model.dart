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
        brand: json['brand'],
        color: json['color'],
        licensePlate: json['license_plate'],
        model: json['model'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'brand': brand,
        'color': color,
        'license_plate': licensePlate,
        'model': model,
        'type': type,
      };

  Vehicle copyWith({
    String? brand,
    String? color,
    String? licensePlate,
    String? model,
    String? type,
  }) {
    return Vehicle(
      brand: brand ?? this.brand,
      color: color ?? this.color,
      licensePlate: licensePlate ?? this.licensePlate,
      model: model ?? this.model,
      type: type ?? this.type,
    );
  }
}
