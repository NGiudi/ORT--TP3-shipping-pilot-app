class VisitStats {
  DateTime eta;
  int packagesCount;

  VisitStats({
    required this.eta,
    required this.packagesCount,
  });

  factory VisitStats.fromJson(Map<String, dynamic> json) => VisitStats(
    eta: DateTime.parse(json['eta']),
    packagesCount: json['packages_count'],
  );

  Map<String, dynamic> toJson() => {
    'eta': eta.toIso8601String(),
    'packages_count': packagesCount,
  };

  VisitStats copyWith({
    DateTime? eta,
    int? packagesCount,
  }) {
    return VisitStats(
      eta: eta ?? this.eta,
      packagesCount: packagesCount ?? this.packagesCount,
    );
  }

  formattedETA() {
    return '${eta.hour}:${eta.minute}';
  }
}
