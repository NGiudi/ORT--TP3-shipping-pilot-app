class Pricing {
  double failedCoefficient;
  double successfulCoefficient;
  double visitPrice;

  Pricing({
    required this.failedCoefficient,
    required this.successfulCoefficient,
    required this.visitPrice,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) => Pricing(
        failedCoefficient: json['failed_coefficient']?.toDouble(),
        successfulCoefficient: json['successful_coefficient']?.toDouble(),
        visitPrice: json['visit_price']?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'failed_coefficient': failedCoefficient,
        'successful_coefficient': successfulCoefficient,
        'visit_price': visitPrice,
      };

  Pricing copyWith({
    double? failedCoefficient,
    double? successfulCoefficient,
    double? visitPrice,
  }) {
    return Pricing(
      failedCoefficient: failedCoefficient ?? this.failedCoefficient,
      successfulCoefficient:
          successfulCoefficient ?? this.successfulCoefficient,
      visitPrice: visitPrice ?? this.visitPrice,
    );
  }
}
