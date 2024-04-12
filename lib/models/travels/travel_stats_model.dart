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
}
