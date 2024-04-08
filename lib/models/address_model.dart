class Address {
  String district;
  int floor;
  String observations;
  String streetName;
  int streetNumber;
  String unit;
  int zipCode;

  Address({
    required this.district,
    required this.floor,
    required this.observations,
    required this.streetName,
    required this.streetNumber,
    required this.unit,
    required this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    district: json["district"],
    floor: json["floor"],
    observations: json["observations"],
    streetName: json["street_name"],
    streetNumber: json["street_number"],
    unit: json["unit"],
    zipCode: json["zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "district": district,
    "floor": floor,
    "observations": observations,
    "street_name": streetName,
    "street_number": streetNumber,
    "unit": unit,
    "zip_code": zipCode,
  };

  String fullAddress() {
    return '$streetName $streetNumber';
  }
}
