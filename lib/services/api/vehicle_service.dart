import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

class VehicleService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future<Vehicle?> get(String licensePlate) async {
    Vehicle? vehicle;

    //? get vehicle in database.
    final url = Uri.https(_baseUrl, 'vehicles/$licensePlate.json');
    final resp = await http.get(url);
    
    Map<String, dynamic>? vehicleJson = json.decode(resp.body);

    //? create vehicle instance.
    if (vehicleJson != null) {
      vehicleJson['license_plate'] = licensePlate;
      vehicle = Vehicle.fromJson(vehicleJson);
    }
    
    return vehicle;
  }
}