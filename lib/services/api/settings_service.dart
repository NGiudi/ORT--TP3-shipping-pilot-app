import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

class SettingsService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future get() async {
    Settings? settings;
    
    //? get settings in database.
    final url = Uri.https(_baseUrl, 'settings.json');
    final resp = await http.get(url);
    
    Map<String, dynamic>? settingsJson = json.decode(resp.body);

    if (settingsJson != null) {
      settings = Settings.fromJson(settingsJson);
    }

    return settings;
  }
}