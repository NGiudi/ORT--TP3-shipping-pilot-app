import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

class VisitsService extends ChangeNotifier {
  final String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  Travel? travel;

  bool isSaving = false;

  VisitsService();

  Future updateVisit(Visit visit) async {
    isSaving = true;
    notifyListeners();

    String jsonBody = jsonEncode(visit.toJson());

    //* update visit.
    final url = Uri.https(_baseUrl, 'visits/${visit.id}.json');
    await http.put(url, body: jsonBody);
    
    isSaving = false;
    notifyListeners();
  }
}