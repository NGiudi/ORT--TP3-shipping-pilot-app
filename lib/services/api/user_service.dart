import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shipping_pilot/models/index.dart';

class UserService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future<User?> get(int docNumber) async {
    User? user;

    //? get user in database.
    final url = Uri.https(_baseUrl, 'users/$docNumber.json');
    final resp = await http.get(url);
    
    Map<String, dynamic>? userJson = json.decode(resp.body);
    
    //? create user instance.
    if (userJson != null) {
      userJson['doc_number'] = docNumber;
      user = User.fromJson(userJson);
    }
    
    return user;
  }

  static Future<void> update(User user) async {
    //? adapt the user for the database.
    Map<String, dynamic> userJson = user.toJson();
  
    userJson.remove('doc_number');

    //? update user in the database.
    final url = Uri.https(_baseUrl, 'users/${user.docNumber}.json');
    await http.put(url, body: jsonEncode(userJson));
  }
}