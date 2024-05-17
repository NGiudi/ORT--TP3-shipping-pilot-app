import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

class VisitService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';
  
  static Future<Visit?> get(String id) async {
    Visit? visit;

    //? get visit in database.
    final url = Uri.https(_baseUrl, 'visits/$id.json');
    final resp = await http.get(url);
    
    Map<String, dynamic>? visitJson = json.decode(resp.body);

    //? create visit instance.
    if (visitJson != null) {
      visitJson['id'] = id;
      visit = Visit.fromJson(visitJson);
    }

    return visit;
  }

  static Future<void> update(Visit visit) async {
    //? adapt the visit for the database.
    Map<String, dynamic> visitJson = visit.toJson();

    visitJson.remove('id');

    //? update visit in the database.
    final url = Uri.https(_baseUrl, 'visits/${visit.id}.json');
    await http.put(url, body: jsonEncode(visitJson));
  }
}