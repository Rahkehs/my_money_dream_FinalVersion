import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../services/auth.dart';

class Budget extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 22, 40),
      appBar: AppBar(
        title: Text(
          "Transaction",
        ),
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/income.jpeg",
                  width: 430,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/expenses.jpeg",
                  width: 430,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
