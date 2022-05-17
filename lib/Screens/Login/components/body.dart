import 'package:flutter/material.dart';
import 'package:my_money_app/Screens/Login/components/reset.dart';
import 'package:my_money_app/Screens/Signup/signup_screen.dart';
import 'package:my_money_app/components/already_have_an_account_acheck.dart';
import 'package:my_money_app/constants.dart';
import 'package:my_money_app/services/auth.dart';
import 'package:my_money_app/services/loading.dart';

class SignIn extends StatefulWidget {
  final Function() toggleView;
  SignIn({required this.toggleView});

  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            // backgroundColor: Colors.blueGrey,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0.0,
              title: Text('LOGIN'),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/userpic.png",
                            width: 200,
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              hintText: ' Email address',
                            ),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            obscureText: true,
                            decoration: textInputDecoration.copyWith(
                                hintText: ' Password'),
                            validator: (val) => val!.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error =
                                        'error! please enter valid email & password';
                                  });
                                }
                              }
                            },
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 0.2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => ResetScreen()),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 0.1),
                          AlreadyHaveAnAccountCheck(press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SignUpScreen();
                              }),
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
