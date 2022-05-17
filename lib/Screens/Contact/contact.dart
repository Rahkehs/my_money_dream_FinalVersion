import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _Contact createState() => _Contact();
}

class _Contact extends State<Contact> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  bool isLoading = true;
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact Us"),
          // toolbarHeight: 5.0,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0.0, 0.0),
                      end: Alignment.bottomRight,
                      stops: [0.04, 10],
                      colors: [Colors.black, Colors.white]),
                ),
                child: Scaffold(
                  body: Stack(
                    children: <Widget>[
                      WebView(
                        key: _key,
                        initialUrl:
                            "https://firstnationsfoundation.org.au/contact/",
                        javascriptMode: JavascriptMode.unrestricted,
                        onPageFinished: (finish) {
                          setState(() {
                            isLoading = false;
                          });
                        },
                      ),
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Stack(),
                    ],
                  ),
                ))));
  }
}
