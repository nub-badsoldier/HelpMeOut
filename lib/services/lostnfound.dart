import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class lostandfoundPage extends StatefulWidget {
  const lostandfoundPage({Key? key}) : super(key: key);

  @override
  _lostandfoundPageState createState() => _lostandfoundPageState();
}

class _lostandfoundPageState extends State<lostandfoundPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://lnf.iiita.ac.in/'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lost And Found Website'),
      ),
      body: WebViewWidget(
        controller: controller, // Allow JavaScript in WebView
      ),
    );
  }
}
