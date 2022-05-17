import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(home: Search()));

class Search extends StatefulWidget {
  @override
  _Magazine createState() => _Magazine();
}

class _Magazine extends State<Search> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl:
              'https://www.visualimpactmagazine.com.au/mags/vi/vimag2019marapr/index.html',
          javascriptMode: JavascriptMode.unrestricted,
        );
      }),
    );
  }
}
