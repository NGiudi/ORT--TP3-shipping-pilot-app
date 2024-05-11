import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

class UserService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future get(int dni) async {
    final url = Uri.https(_baseUrl, 'users/$dni.json');
    final resp = await http.get(url);
    
    return json.decode(resp.body);
  }

  static Future update(User user) async {
    //? adapt the user for the database.
    Map<String, dynamic> userJson = user.toJson();
  
    userJson.remove('doc_number');

    //? update user in the database.
    final url = Uri.https(_baseUrl, 'users/${user.docNumber}.json');
    await http.put(url, body: jsonEncode(userJson));
  }
}