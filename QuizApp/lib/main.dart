import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'frontend/Authentication/signIn.dart';
import 'frontend/Authentication/signUp.dart';
import 'frontend/Home/Home.dart';
import 'frontend/Welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize Flutter

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: 'codsoft-wisdom-wave-63d82');
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
