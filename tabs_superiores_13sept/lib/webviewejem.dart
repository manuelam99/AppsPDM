import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebViewEjemplo extends StatefulWidget {
  final String url;
  const WebViewEjemplo(this.url);

  @override
  _WebViewEjemploState createState() => _WebViewEjemploState();
}

class _WebViewEjemploState extends State<WebViewEjemplo> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}
