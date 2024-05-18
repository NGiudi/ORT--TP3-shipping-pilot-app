class TravelStats {
  DateTime eta;
  int packagesCount;
  int visitsCount;

  TravelStats({
    required this.eta,
    required this.packagesCount,
    required this.visitsCount,
  });

  factory TravelStats.fromJson(Map<String, dynamic> json) => TravelStats(
        eta: DateTime.parse(json['eta']),
        packagesCount: json['packages_count'],
        visitsCount: json['visits_count'],
      );

  Map<String, dynamic> toJson() => {
        'eta': eta.toIso8601String(),
        'packages_count': packagesCount,
        'visits_count': visitsCount,
      };

  TravelStats copyWith({
    DateTime? eta,
    int? packagesCount,
    int? visitsCount,
  }) {
    return TravelStats(
      eta: eta ?? this.eta,
      packagesCount: packagesCount ?? this.packagesCount,
      visitsCount: visitsCount ?? this.visitsCount,
    );
  }

  formattedETA() {
    return '${eta.hour}:${eta.minute}';
  }
}
