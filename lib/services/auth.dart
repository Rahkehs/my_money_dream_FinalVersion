import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_money_app/models/user.dart' as u;

class AuthService {
  //sign in with emaul/password
  //register user
  //signout
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  u.User? _userFromFirebaseUser(User? user) {
    return user != null ? u.User(uid: user.uid) : null;
  }
  //auth change user stream

  Stream<u.User?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in annonymously

//SignIn with Email and Password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
