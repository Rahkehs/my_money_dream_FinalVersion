import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_money_app/Screens/Calender/calender.dart';
import 'package:my_money_app/pages/budget/budget.dart';
import 'package:my_money_app/pages/budget/fined.dart';

import '../../services/auth.dart';

class Landing extends StatelessWidget {
  Landing({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
        ),
        backgroundColor: Colors.black,
        // toolbarHeight: 10.0,
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
              SizedBox(
                height: 15.0,
                width: 10.0,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Budget1(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/budget.jpeg",
                            width: 430,
                            height: 220,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          height: 220,
                          width: 400,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Budgeting',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          )),
                    ],
                  )),
              // child: Text(
              //   'Show text here',
              //   style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 22.0),
              // )),

              SizedBox(
                height: 15.0,
                width: 10.0,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => FinEd(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/finaed.jpeg",
                            width: 430,
                            height: 220,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          height: 220,
                          width: 400,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Financial Education',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          )),
                    ],
                  )),

              SizedBox(
                height: 15.0,
                width: 10.0,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Calender(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/cal.png",
                            width: 430,
                            height: 220,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          height: 220,
                          width: 400,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Calender',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          )),
                    ],
                  )),

              SizedBox(
                height: 150.0,
                width: 10.0,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
