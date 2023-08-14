import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'frontend/Authentication/signIn.dart';
import 'frontend/Authentication/signUp.dart';
import 'frontend/Home/Home.dart';
import 'frontend/Welcome/welcome.dart';
import 'backend/Database/Data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize Flutter

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: 'codsoft-wisdom-wave-63d82');
  print('initialized firebase app');
  // Adding Questions to the Database
  // FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  // for(int i=0;i<Data.questions.length;i++){
  //   await _dbRef.child('questions').child('question_$i').set(Data.questions[i]);
  // }


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
        '/home': (context) => const Home()
      },
    );
  }
}
