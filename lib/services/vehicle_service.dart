import 'dart:convert';

import 'package:http/http.dart' as http;

class VehicleService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future get(String licensePlate) async {
    final url = Uri.https(_baseUrl, 'vehicles/$licensePlate.json');
    final resp = await http.get(url);
    
    return json.decode(resp.body);
  }
}