import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future<Map<String, dynamic>> _getAdditionalTravelInfo(Map<String, dynamic> travelJson) async {
    //* get driver.
    User? driver = await UserService.get(travelJson['driver']);
    travelJson['driver'] = driver;

    //* get vehicle.
    Vehicle? vehicle = await VehicleService.get(travelJson['vehicle']);
    travelJson['vehicle'] = vehicle;

    //* get visits.
    List<Visit> visits = [];

    for (int i=1; i <= travelJson['stats']['visits_count'] ; i++) {
      String id = '${travelJson['id']}-$i';

      Visit? visit = await VisitService.get(id);
      
      if (visit != null) {
        visits.add(visit);
      }
    }

    travelJson['visits'] = visits;

    return travelJson;
  } 

  static Future<List<Travel>> getAll() async {
    List<Travel> travelsList = [];

    //* get travels in database.
    final url = Uri.https(_baseUrl, 'travels.json');
    final resp = await http.get(url);

    Map<String, dynamic>? travelsObj = json.decode(resp.body);

    if (travelsObj != null) {
      for (String key in travelsObj.keys) {
      
        Map<String, dynamic> travelJson = travelsObj[key];
        travelJson['id'] = key;

        travelJson = await _getAdditionalTravelInfo(travelJson);
        travelsList.add(Travel.fromJson(travelJson));
      }
    }

    return travelsList;
  }

  static Future<Travel?> get(String uuid) async {
    //* get travel in database.
    final url = Uri.https(_baseUrl, 'travels/$uuid.json');
    final resp = await http.get(url);

    Map<String, dynamic>? travelJson = json.decode(resp.body);

    if (travelJson != null) {
      travelJson['id'] = uuid;

      travelJson = await _getAdditionalTravelInfo(travelJson);

      return Travel.fromJson(travelJson);
    }

    return null;
  }

  static Future update(Travel travel) async {
    //? adapt the travel for the database.
    Map<String, dynamic> travelJson = travel.toJson();
    
    travelJson['driver'] = travel.driver.docNumber;
    travelJson['vehicle'] = travel.vehicle.licensePlate;

    travelJson.remove('id');
    travelJson.remove('visits');

    //? update travel in the database.
    final url = Uri.https(_baseUrl, 'travels/${travel.id}.json');
    await http.put(url, body: jsonEncode(travelJson));
  }
}