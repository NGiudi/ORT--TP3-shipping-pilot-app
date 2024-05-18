import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

Settings settingsFromJson(String str) => Settings.fromJson(json.decode(str));

String settingsToJson(Settings data) => json.encode(data.toJson());

class Settings {
  Pricing pricing;

  Settings({
    required this.pricing,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        pricing: Pricing.fromJson(json['pricing']),
      );

  Map<String, dynamic> toJson() => {
        'pricing': pricing.toJson(),
      };

  Settings copyWith({
    Pricing? pricing,
  }) {
    return Settings(
      pricing: pricing ?? this.pricing.copyWith(),
    );
  }
}
