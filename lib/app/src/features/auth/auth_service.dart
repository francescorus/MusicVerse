import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl = "http://localhost:5001";

  Future<void> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data['token'];
        // Salva il token in modo sicuro, ad esempio con flutter_secure_storage
        print('Login successful, token: $token');
      } else if (response.statusCode == 401) {
        print('Invalid credentials');
      } else {
        print('Failed to login, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  /*Future<bool> login(String username, String password) async {
    return username == 'user' && password == 'pass';
  }*/
}
