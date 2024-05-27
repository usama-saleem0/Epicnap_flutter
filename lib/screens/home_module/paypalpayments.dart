import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PayPalWebView(
        url: 'https://www.sandbox.paypal.com/checkoutnow?token=4TG57519D59751622',
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
        title: Text('PayPal Checkout'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          // Handle navigation requests if needed.
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  WebView({required String initialUrl, required javascriptMode, required NavigationDecision Function(NavigationRequest request) navigationDelegate}) {}
}
