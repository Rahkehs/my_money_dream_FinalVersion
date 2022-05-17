import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_money_app/controllers/db_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_money_app/pages/budget/budget.dart';
import 'package:my_money_app/pages/homepage.dart';
import 'package:my_money_app/pages/landingpage/budget.dart';
import 'package:my_money_app/static.dart' as Static;
import 'package:flutter/services.dart';

import '../../services/auth.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({Key? key}) : super(key: key);

  @override
  _AddIncomeState createState() => _AddIncomeState();
}

final AuthService _auth = AuthService();

class _AddIncomeState extends State<AddIncome> {
  DateTime selectedDate = DateTime.now();
  int? amount;
  String note = "Transaction";
  String type = "Income";

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
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
                builder: (context) => Budget1(),
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
      // backgroundColor: Color.fromARGB(255, 1, 22, 40),
      //
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.0, 0.0),
              end: Alignment.bottomRight,
              stops: [0.04, 10],
              colors: [Colors.black, Colors.white]),
        ),
        child: ListView(
          padding: EdgeInsets.all(
            12.0,
          ),
          children: [
            Text(
              "Income",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            //
            SizedBox(
              height: 20.0,
            ),
            //
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  padding: EdgeInsets.all(
                    12.0,
                  ),
                  child: Icon(
                    Icons.attach_money_sharp,
                    size: 24.0,
                    // color: Colors.grey[700],
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "0",
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    onChanged: (val) {
                      try {
                        amount = int.parse(val);
                      } catch (e) {
                        // show Error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red[900],
                            duration: Duration(
                              seconds: 3,
                            ),
                            content: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "Please enter Amount in numbers",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    // textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            //
            SizedBox(
              height: 20.0,
            ),
            //
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  padding: EdgeInsets.all(
                    12.0,
                  ),
                  child: Icon(
                    Icons.description,
                    size: 24.0,
                    // color: Colors.grey[700],
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Description",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    onChanged: (val) {
                      note = val;
                    },
                  ),
                ),
              ],
            ),
            //
            // SizedBox(
            //   height: 20.0,
            // ),
            //
            // Row(
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //         color: Colors.blue[900],
            //         borderRadius: BorderRadius.circular(
            //           16.0,
            //         ),
            //       ),
            //       padding: EdgeInsets.all(
            //         12.0,
            //       ),
            //       child: Icon(
            //         Icons.attach_money_sharp,
            //         size: 24.0,
            //         // color: Colors.grey[700],
            //         color: Colors.white,
            //       ),
            //     ),
            //     SizedBox(
            //       width: 12.0,
            //     ),
            //     // ChoiceChip(
            //     //   label: Text(
            //     //     "Income",
            //     //     style: TextStyle(
            //     //       fontSize: 18.0,
            //     //       color: type == "Income" ? Colors.white : Colors.black,
            //     //     ),
            //     //   ),
            //     //   selectedColor: Colors.blue[900],
            //     //   onSelected: (val) {
            //     //     if (val) {
            //     //       setState(() {
            //     //         type = "Income";
            //     //         if (note.isEmpty || note == "Expense") {
            //     //           note = 'Income';
            //     //         }
            //     //       });
            //     //     }
            //     //   },
            //     //   selected: type == "Income" ? true : false,
            //     // ),
            //     // SizedBox(
            //     //   width: 8.0,
            //     // ),
            //     // ChoiceChip(
            //     //   label: Text(
            //     //     "Expense",
            //     //     style: TextStyle(
            //     //       fontSize: 18.0,
            //     //       color: type == "Expense" ? Colors.white : Colors.black,
            //     //     ),
            //     //   ),
            //     //   selectedColor: Colors.blue[900],
            //     //   onSelected: (val) {
            //     //     if (val) {
            //     //       setState(() {
            //     //         type = "Expense";

            //     //         if (note.isEmpty || note == "Income") {
            //     //           note = 'Expense';
            //     //         }
            //     //       });
            //     //     }
            //     //   },
            //     //   selected: type == "Expense" ? true : false,
            //     // ),
            //   ],
            // ),
            //
            SizedBox(
              height: 20.0,
            ),
            //
            SizedBox(
              height: 50.0,
              child: TextButton(
                onPressed: () {
                  _selectDate(context);
                  //
                  // to make sure that no keyboard is shown after selecting Date
                  FocusScope.of(context).unfocus();
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.zero,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      padding: EdgeInsets.all(
                        12.0,
                      ),
                      child: Icon(
                        Icons.date_range,
                        size: 24.0,
                        // color: Colors.grey[700],
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "${selectedDate.day} ${months[selectedDate.month - 1]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //
            SizedBox(
              height: 50.0,
            ),
            //
            Center(
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  onPressed: () {
                    if (amount != null) {
                      DbHelper dbHelper = DbHelper();
                      dbHelper.addData(amount!, selectedDate, type, note);
                      Navigator.of(context)
                          .push(
                        CupertinoPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      )
                          .then((value) {
                        setState(() {});
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red[700],
                          content: Text(
                            "Please enter a valid Amount !",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Add Income",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
