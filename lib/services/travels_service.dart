import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shipping_pilot/models/models.dart';

class TravelsService extends ChangeNotifier {
  final String _baseUrl = "shipping-pilot-app-default-rtdb.firebaseio.com";
  final List<Travel> travels = [];

  bool isLoading = true;

  TravelsService() {
    getRoutes();
  }

  //TODO: modificar.
  Future getRoutes() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'routes.json');
    final resp = await http.get(url);

    final List<dynamic> travelList = json.decode(resp.body);

    for (dynamic t in travelList) {
      final travel = Travel.fromJson(t);
      travels.add(travel); 
    }

    isLoading = false;
    notifyListeners();
  }
}