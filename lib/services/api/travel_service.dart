import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future _getTravel(String id) async {
    final url = Uri.https(_baseUrl, 'travels/$id.json');
    final resp = await http.get(url);

    return json.decode(resp.body);
  }

  static Future get(String uuid) async {
    //* get travel.
    Map<String, dynamic>? travel = await _getTravel(uuid);

    if (travel != null) {
      travel['id'] = uuid;

      //* get driver.
      Map<String, dynamic> driver = await UserService.get(travel['driver']);
      driver['doc_number'] = travel['driver'];
      travel['driver'] = driver;

      //* get vehicle.
      Map<String, dynamic> vehicle = await VehicleService.get(travel['vehicle']);
      vehicle['license_plate'] = travel['vehicle'];
      travel['vehicle'] = vehicle;

      //* get visits.
      List<Map<String, dynamic>> visits = [];

      for (int i=1; i <= travel['stats']['visits_count'] ; i++) {
        String id = '${travel['id']}-$i';

        Map<String, dynamic> visit = await VisitService.get(id);
        visit['id'] = id;

        visits.add(visit);
      }

      travel['visits'] = visits;

      return Travel.fromJson(travel);
    }
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