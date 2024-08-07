import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> sendToServer(String text) async {
    final response = await http.post(
      Uri.parse('~~~~~~~~~~~~~~'), // local IP
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'text': text,
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['message'];
    } else {
      return "Sorry, Failed to load message from server";
    }
  }
}
