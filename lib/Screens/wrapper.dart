import 'package:flutter/material.dart';
import 'package:my_money_app/Screens/authenticate/authenticate.dart';
import 'package:my_money_app/Screens/navigation/nav.dart';
import 'package:my_money_app/models/user.dart';
import 'package:my_money_app/pages/splash.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Nav();
    }
  }
}
