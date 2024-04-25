import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shipping_pilot/models/models.dart';

class TravelsService extends ChangeNotifier {
  final String _baseUrl = "shipping-pilot-app-default-rtdb.firebaseio.com";

  Travel? travel;

  bool isLoading = true;

  TravelsService() {
    getRoute("40388846-24042024");//TODO: aca deberíamos pasar el string "dni del conductor-dia" 
  }

  Future getDriver(String dni) async {
    final url = Uri.https(_baseUrl, 'drivers/$dni.json');
    final resp = await http.get(url);
    
    return json.decode(resp.body);
  }

  Future getTravel(String uuid) async {
    final url = Uri.https(_baseUrl, 'travels/$uuid.json');
    final resp = await http.get(url);

    return json.decode(resp.body);
  }

  Future getVehicle(String licensePlate) async {
    final url = Uri.https(_baseUrl, 'vehicles/$licensePlate.json');
    final resp = await http.get(url);
    
    return json.decode(resp.body);
  }

  Future getRoute(String uuid) async {
    //* start generate travel information.
    isLoading = true;
    notifyListeners();

    //* get travel.
    Map<String, dynamic>? travel = await getTravel(uuid);
    
    if (travel != null) {
      //* get driver.
      Map<String, dynamic> driver = await getDriver(travel["driver"]);
      driver["doc_number"] = int.parse(travel["driver"]);
      travel["driver"] = driver;

      //* get vehicle.
      Map<String, dynamic> vehicle = await getVehicle(travel["vehicle"]);
      vehicle["license_plate"] = travel["vehicle"];
      travel["vehicle"] = vehicle;

      this.travel = Travel.fromJson(travel);
    }
    
    //* end generate travel information.
    isLoading = false;
    notifyListeners();
  }
}