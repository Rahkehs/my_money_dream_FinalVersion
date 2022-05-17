import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_money_app/Screens/navigation/nav.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FinEd extends StatefulWidget {
  const FinEd({Key? key}) : super(key: key);

  @override
  _FinEd createState() => _FinEd();
}

bool isLoading = true;
final _key = UniqueKey();

class _FinEd extends State<FinEd> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Financial Education"),
          // toolbarHeight: 5.0,
          backgroundColor: Colors.black,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Nav(),
                ),
              );
            },
          ),
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
                            "https://firstnationsfoundation.org.au/what-we-do-2/",
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
