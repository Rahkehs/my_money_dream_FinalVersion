import 'package:firebase_core/firebase_core.dart';
import 'package:my_money_app/Screens/Welcome/welcome_screen.dart';
import 'package:my_money_app/services/auth.dart';
import 'package:my_money_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('money');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<User?>.value(
    value: AuthService().user,
    initialData: null,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Money App',
      theme: myTheme,
      home: WelcomeScreen(),
    );
  }
}
