import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://your-flask-backend-url'; // Replace with your backend URL

  // Fetch password details from the backend
  Future<Map<String, String>> getPassword(String entryName) async {
    final response = await http.get(
      Uri.parse('$baseUrl/get_password?entry_name=$entryName'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'website': data['website'],
        'username': data['username'],
        'password': data['password'],
      };
    } else {
      throw Exception('Failed to load password');
    }
  }

  // Add a new password entry to the KeePass file
  Future<void> addPassword(String title, String username, String password, String url) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add_password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'username': username,
        'password': password,
        'url': url,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add password');
    }
  }
}
