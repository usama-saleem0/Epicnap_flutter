import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../controller/home_module_controller/dashboard_screen_controller.dart';

class PayPalPaymentScreens extends StatefulWidget {
  @override
  _PayPalPaymentScreenState createState() => _PayPalPaymentScreenState();
}

class _PayPalPaymentScreenState extends State<PayPalPaymentScreens> {
  final String baseUrl = 'https://abiola.conceptrecall.com'; // Replace with your Laravel API base URL
  late WebViewController _webViewController;
  String currentUrl = 'https://www.sandbox.paypal.com';

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
      if (response.statusCode == 200) {
        final String responseData = response.body;

        // Assuming the token is always in the format "token=..."
        List<String> parts = responseData.split('=');
        if (parts.length == 2) {
          String token = parts[1];
          return token;
        } else {
          return "Invalid response format";
        }
      } else if (response.headers['content-type']?.contains('text/html') ?? false) {
        // Handle HTML response
        return "HTML response: ${response.body}";
      } else {
        return "Failed to initiate payment: ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Error: $e";
    }

    //   if (response.statusCode == 200) {
    //     final Map<String, dynamic> responseData = json.decode(response.body);
    //
    //     if (responseData['status'] == "success") {
    //       return "Payment initiation successful";
    //     } else {
    //       return "Payment initiation failed: ${responseData['message']}";
    //     }
    //   } else if (response.headers['content-type']?.contains('text/html') ?? false) {
    //     // Handle HTML response
    //     return "HTML response: ${response.body}";
    //   } else {
    //     return "Failed to initiate payment: ${response.reasonPhrase}";
    //   }
    // } catch (e) {
    //   return "Error: $e";
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('PayPal Payment'),
      // ),
      
      // backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/paypalback.jpg'), // Path to your image asset
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {

                  DashboardScreenController dashboardScreenController = Get.find<DashboardScreenController>();
                  int userId = dashboardScreenController.id.value;

                  // print("Influencer ID: $userId");
                  initiatePaypalPayment(userId: userId)
                      .then((result) {
                    print(result);
                    String resultAsString = result.toString();
                    String dynamicToken = result;
        
                    // Your static URL template
                    String staticBaseUrl = "https://www.sandbox.paypal.com/checkoutnow?token=";
        
                    // Concatenate the dynamic token with the base URL
                    String paypalUrls = staticBaseUrl + dynamicToken;
                    print(paypalUrls);
        
                    String paypalUrl = paypalUrls;
                    if (result != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PayPalWebView(paypalUrl: paypalUrl),
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
                  }).catchError((error) {
                    // Handle errors during the API call
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error: $error"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200], // Change the button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
                  ),
                  padding: EdgeInsets.all(16.0),
                  elevation: 15.0, // Adjust the elevation for the box shadow
                  shadowColor: Colors.grey,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/paypal_logo.png', // Add the path to your PayPal logo asset
                      height: 30.0,
                    ),
        
                    Text(
                      'Pay With PayPal',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('PayPal Payment'),
  //     ),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           initiatePaypalPayment(userId: 1)
  //               .then((result) {
  //                 print(result);
  //             String resultAsString = result.toString();
  //             // print(resultAsString);
  //
  //                 String dynamicToken = result;
  //
  //                 // Your static URL template
  //                 String staticBaseUrl = "https://www.sandbox.paypal.com/checkoutnow?token=";
  //
  //                 // Concatenate the dynamic token with the base URL
  //                 String paypalUrls = staticBaseUrl + dynamicToken;
  //                 print(paypalUrls);
  //
  //
  //             // print(trimmedUrl);
  //             String paypalUrl = paypalUrls;
  //             if (result !=null) {
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => PayPalWebView(paypalUrl: paypalUrl),
  //                   // builder: (context) => PayPalWebView(
  //                   //   initialUrl: currentUrl, // Use the redirected URL
  //                   //   onUrlChanged: (String url) {
  //                   //     setState(() {
  //                   //       currentUrl = url;
  //                   //     });
  //                   //   },
  //                   // ),
  //                 ),
  //               );
  //             }
  //             else {
  //               // Handle payment initiation failure
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(
  //                   content: Text(result),
  //                   backgroundColor: Colors.red,
  //                 ),
  //               );
  //             }
  //           })
  //               .catchError((error) {
  //             // Handle errors during the API call
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(
  //                 content: Text("Error: $error"),
  //                 backgroundColor: Colors.red,
  //               ),
  //             );
  //           });
  //         },
  //         child: Text('Initiate PayPal Payment'),
  //       ),
  //     ),
  //   );
  // }
}

class PayPalWebView extends StatefulWidget {
  final String paypalUrl;

  const PayPalWebView({Key? key, required this.paypalUrl}) : super(key: key);

  @override
  _PayPalWebViewState createState() => _PayPalWebViewState();
}

class _PayPalWebViewState extends State<PayPalWebView> {

  late WebViewController  controller;

  getWebView(){
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.sandbox.paypal.com')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paypalUrl));
  }

  @override
  void initState() {
    getWebView();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('PayPal Payment'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }

  // WebView({required String initialUrl, required javascriptMode, required NavigationDecision Function(NavigationRequest request) navigationDelegate}) {}
}

// class PayPalWebView extends StatefulWidget {
//   final String paypalUrl;
//   // final Function(String) onUrlChanged;
//
//   PayPalWebView({required this.paypalUrl});
//
//   @override
//   _PayPalWebViewState createState() => _PayPalWebViewState();
// }
//
// class _PayPalWebViewState extends State<PayPalWebView> {
//   late WebViewController _webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PayPal Payment'),
//       ),
//       body: WebView(
//         initialUrl: widget.paypalUrl,
//         javascriptMode: JavascriptMode.unrestricted,
//
//         onPageFinished: (String url) {
//           // Handle page load finished
//         },
//         onWebViewCreated: (WebViewController webViewController) {
//           _webViewController = webViewController;
//         },
//       ),
//     );
//   }
// }


void main() {
  runApp(MaterialApp(
    home: PayPalPaymentScreens(),
  ));
}
