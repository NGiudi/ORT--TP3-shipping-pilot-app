import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

class VisitService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';
  
  static Future get(String id) async {
    final url = Uri.https(_baseUrl, 'visits/$id.json');
    final resp = await http.get(url);
    
    return json.decode(resp.body);
  }

  static Future update(Visit visit) async {
    String jsonBody = jsonEncode(visit.toJson());

    //* update visit.
    final url = Uri.https(_baseUrl, 'visits/${visit.id}.json');
    await http.put(url, body: jsonBody);
  }
}