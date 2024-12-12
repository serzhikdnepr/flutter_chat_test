import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AuthRepository {
  Future<String> authenticateUser(String username);
}

class AuthRepositoryImpl implements AuthRepository {
  final String _baseUrl;

  AuthRepositoryImpl(this._baseUrl);

  @override
  Future<String> authenticateUser(String username) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success']) {
        return data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } else {
      throw Exception('Failed to authenticate');
    }
  }
}
