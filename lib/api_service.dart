import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  final String baseUrl = 'http://10.0.2.2:8000';
 // Replace with your Laravel API URL


  Future<void> postRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    print(url);
    print(data);
    try {
      final response = await http.post(
        url,
        body: data,

      ).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        // Request was successful, handle the response here
        print('Response: ${response.body}');
      } else {
        // Request failed, handle errors here
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions, e.g., connection errors
      print('Error: $e');
    }
  }
}
