import 'package:http/http.dart' as http;

class Api {
  static Future<void> registerUser(String username, String email, String password, String country) async {
    final url = Uri.parse('http://127.0.0.1:8000/login'); // Replace with your API endpoint

    final response = await http.post(
      url,
      body: {
        'username': username,
        'email': email,
        'password': password,
        'country': country,
      },
    );

    if (response.statusCode == 200) {
      // Registration was successful, handle the response accordingly
      print('Registration successful');
    } else {
      // Registration failed, handle the response accordingly
      print('Registration failed');
      print(response.body); // You can inspect the response for more details
    }
  }

// You can add more API request functions here
}
