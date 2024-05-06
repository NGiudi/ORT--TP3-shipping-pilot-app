import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static const String _baseUrl = 'shipping-pilot-app-default-rtdb.firebaseio.com';

  static Future get(int dni) async {
    final url = Uri.https(_baseUrl, 'users/$dni.json');
    final resp = await http.get(url);
    
    return json.decode(resp.body);
  }
}