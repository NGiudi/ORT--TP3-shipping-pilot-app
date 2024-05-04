import 'package:http/http.dart' as http;
import 'dart:convert';

class SettingsService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future get() async {
    final url = Uri.https(_baseUrl, 'settings.json');
    final resp = await http.get(url);
    
    return json.decode(resp.body);
  }
}