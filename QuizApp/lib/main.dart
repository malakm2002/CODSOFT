import 'package:flutter/material.dart';
import 'package:quiz_app/frontend/Authentication/signIn.dart';
import 'package:quiz_app/frontend/Home/Home.dart';
import 'package:quiz_app/frontend/Welcome/welcome.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'frontend/Authentication/signUp.dart';

Future<void> main() async {

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/home': (context) => Home()
      },
    );
  }
}
