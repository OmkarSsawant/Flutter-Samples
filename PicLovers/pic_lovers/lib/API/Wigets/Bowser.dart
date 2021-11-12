import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
class CustomBrowser extends StatelessWidget {
  String url;

  CustomBrowser(this.url);
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      
    );
  }
}