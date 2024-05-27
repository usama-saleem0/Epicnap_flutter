// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }
//
// class _RegistrationPageState extends State<RegistrationPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   // Future<void> _registerUser() async {
//   //   final url = Uri.parse('http://127.0.0.1:8000/register');
//   //   final response = await http.post(
//   //     url,
//   //     body: {
//   //       'name': nameController.text,
//   //       'email': emailController.text,
//   //       'password': passwordController.text,
//   //     },
//   //   );
//   //
//   //   if (response.statusCode == 200) {
//   //     // Registration successful, you can handle success here
//   //     print('Registration Successful');
//   //   } else {
//   //     // Registration failed, handle errors
//   //     print('Registration Failed');
//   //   }
//   // }
//   // Future<void> _registerUser() async {
//   //   final url = Uri.parse('http://10.0.2.2:8000/api/postcourse');
//   //
//   //   // Create a Map containing the data you want to send in JSON format
//   //   final Map<String, dynamic> data = {
//   //     // 'key1': 'value1',
//   //     // 'key2': 'value2',
//   //     // 'key3': 42,
//   //     'name': nameController.text,
//   //     'email': emailController.text,
//   //     'password': passwordController.text,
//   //   };
//   //
//   //   // Encode the data to JSON
//   //   final String jsonData = json.encode(data);
//   //
//   //   // Set the headers for the request (you can add more headers if needed)
//   //   final Map<String, String> headers = {
//   //     'Content-Type': 'application/json',
//   //     'Accept' : 'application/json',
//   //     // Add any other headers here
//   //   };
//   //
//   //   try {
//   //     final response = await http.post(
//   //       url,
//   //       headers: headers,
//   //       body: jsonData,
//   //     );
//   //
//   //     if (response.statusCode == 200) {
//   //       // Request was successful, handle the response here
//   //       // print('Response: ${response.body}');
//   //
//   //       print('Response: ${response.body}');
//   //     } else {
//   //       // Request failed, handle errors here
//   //       print('Request failed with status code: ${response.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     // Handle network or request errors
//   //     print('Error: $e');
//   //   }
//   // }
//
//   Future<void> _registerUser() async {
//     final url = Uri.parse('http://10.0.2.2:8000/api/register');
//   // final Map<String, String> headers = {
//   //       'Content-Type': 'application/json',
//   //       'Accept' : 'application/json',
//   //       // Add any other headers here
//   //     };
//     try {
//       final response = await http.post(
//         url,
//         // headers: headers,
//         body: {
//           'name': nameController.text,
//           'email': emailController.text,
//           'password': passwordController.text,
//         },
//       );
//
//       if (response.statusCode == 200) {
//         // Registration successful, you can handle success here
//         print('Registration Successful');
//       } else {
//         // Registration failed, handle errors
//         print('Registration Failed with status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions, e.g., connection errors
//       print('Error: $e');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registrations'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextFormField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _registerUser,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'api_service.dart'; // Import your API service class

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  APIService apiService = APIService(); // Create an instance of your API service

  void _registerUser() {
    // Prepare the data for registration
    final data = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };

    // Make the POST request to register the user
    apiService.postRequest(
       'api/register',
      data,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
