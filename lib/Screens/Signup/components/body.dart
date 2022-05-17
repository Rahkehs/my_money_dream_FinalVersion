import 'package:my_money_app/Screens/Login/login_screen.dart';
import 'package:my_money_app/components/already_have_an_account_acheck.dart';
import 'package:my_money_app/constants.dart';
import 'package:my_money_app/controllers/db_helper.dart';
import 'package:my_money_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function() toggleView;
  Register({required this.toggleView});

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String name = '';
  String phone = '';
  String address = '';
  String postcode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('SIGNUP'),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.0, 0.0),
                end: Alignment.bottomRight,
                stops: [0.04, 10],
                colors: [Colors.black, Colors.white]),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50.0),
                        Image.asset(
                          "assets/images/loginicon.png",
                          width: 80.0,
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 10.0,
                        ),
                        TextFormField(
                          autofocus: false,
                          decoration: textInputDecoration.copyWith(
                              fillColor: Colors.white,
                              hintText: "eg: John Citizen",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                              labelText: 'Your Full Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: new BorderSide())),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter a valid name' : null,
                          onChanged: (val) async {
                            setState(() => name = val);
                            if (name.isNotEmpty) {
                              DbHelper dbHelper = DbHelper();
                              await dbHelper.addName(name);
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 10.0,
                        ),
                        TextFormField(
                          autofocus: false,
                          decoration: textInputDecoration.copyWith(
                              fillColor: Colors.white,
                              hintText: "eg:you@example.com",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                              labelText: 'Email address',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: new BorderSide())),
                          validator: (val) => val!.isEmpty
                              ? 'Enter a valid email address'
                              : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: textInputDecoration.copyWith(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 10.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: textInputDecoration.copyWith(
                              hintText: "confirm password",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 10.0,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.white,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Signup was Successful.\nPlease navigate to LogIn')));
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Regirstration failed. Please try again';
                                });
                              }
                            }
                          },
                          // style: ElevatedButton.styleFrom(
                          //shape: new RoundedRectangleBorder(
                          //      borderRadius: new BorderRadius.circular(30.0),
                          //    ),
                          // ),
                        ),
                        SizedBox(height: 0.1),
                        AlreadyHaveAnAccountCheck(
                            login: false,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreen();
                                  },
                                ),
                              );
                              SizedBox(height: 12.0);
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
