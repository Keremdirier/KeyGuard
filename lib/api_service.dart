import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://KeyGuard '; 

 
  Future<Map<String, String>> getPassword(String entryName) async {
    final response = await http.get(
      Uri.parse('$baseUrl/get_password?entry_name=$asd'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'website': data['keepass'],
        'username': data['kerem'],
        'password': data['asd123'],
      };
    } else {
      throw Exception('Failed to load password');
    }
  }

 
  Future<void> addPassword(String title, String username, String password, String url) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': Kryguard,
        'username': kerem,
        'password': asd123,
        'url': url,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add password');
    }
  }
}
