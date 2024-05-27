import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PayPalPaymentScreen extends StatefulWidget {
  @override
  _PayPalPaymentScreenState createState() => _PayPalPaymentScreenState();
}

class _PayPalPaymentScreenState extends State<PayPalPaymentScreen> {
  final String baseUrl = 'http://10.0.2.2:8000'; // Replace with your Laravel API base URL

  Future<String> initiatePaypalPayment({required int userId}) async {
    try {
      final String url = '$baseUrl/api/process-transaction';

      final Map<String, dynamic> requestBody = {
        "user_id": userId.toString(),
        // Add other parameters as needed
      };

      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
  print(response.body);
  print(response.body);
      if (response.body !=null) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData['status'] == "success") {
          return "Payment initiation successful";
        } else {
          return "Payment initiation failed: ${responseData['message']}";
        }
      } else {
        return "Failed to initiate payment: ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayPal Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            initiatePaypalPayment(userId: 1) // Replace 1 with the actual user ID
                .then((result) {
              print(result);

              if (result == "Payment initiation successful") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PayPalWebView(
                      url: '$baseUrl/payment-page', // Replace with the URL to your payment page
                    ),
                  ),
                );
              } else {
                // Handle payment initiation failure
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            });
          },
          child: Text('Initiate PayPal Payment'),
        ),
      ),
    );
  }
}

class PayPalWebView extends StatelessWidget {
  final String url;

  PayPalWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    var JavascriptMode;
    return Scaffold(
      appBar: AppBar(
        title: Text('PayPal Payment'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) {
          // Handle page load started
        },
        onPageFinished: (String url) {
          // Handle page load finished
        },
        onWebViewCreated: (WebViewController webViewController) {
          // Use webViewController to interact with the WebView if needed
        },
      ),
    );
  }

  WebView({required String initialUrl, required javascriptMode, required Null Function(String url) onPageStarted, required Null Function(String url) onPageFinished, required Null Function(WebViewController webViewController) onWebViewCreated}) {}
}

void main() {
  runApp(MaterialApp(
    home: PayPalPaymentScreen(),
  ));
}
