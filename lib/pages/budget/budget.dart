import 'package:flutter/material.dart';
import 'package:my_money_app/Screens/expense/expense.dart';
import 'package:my_money_app/pages/homepage.dart';

import '../../Screens/income/income.dart';
import '../../Screens/navigation/nav.dart';
import '../../services/auth.dart';

class Budget1 extends StatelessWidget {
  Budget1({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction",
        ),
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
        // actions: <Widget>[
        //   TextButton.icon(
        //     style: TextButton.styleFrom(
        //       primary: Colors.white,
        //     ),
        //     icon: Icon(Icons.person),
        //     label: Text('logout'),
        //     onPressed: () async {
        //       await _auth.signOut();
        //     },
        //   )
        // ],
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
              Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => AddIncome(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/income.jpeg",
                            width: 430,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          height: 240,
                          width: 400,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Income',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          )),
                    ],
                  )),
              SizedBox(
                height: 10.0,
                width: 10.0,
              ),
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.0, 0.0),
                        end: Alignment.bottomRight,
                        stops: [0.04, 10],
                        colors: [Colors.black, Colors.white]),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => AddExpense(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/expenditure.jpeg",
                            width: 430,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          height: 240,
                          width: 400,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Expenses',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          )),
                    ],
                  )),
              SizedBox(
                height: 10.0,
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
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/savings.jpeg",
                            width: 430,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                          height: 240,
                          width: 400,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Statements',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          )),
                    ],
                  )),
              SizedBox(
                height: 30.0,
                width: 30.0,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
