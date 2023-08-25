import 'package:com.codsoft.quizApp/frontend/Quizzes/Quiz.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'frontend/Authentication/ResetPassword.dart';
import 'frontend/Authentication/signIn.dart';
import 'frontend/Authentication/signUp.dart';
import 'frontend/Home/Home.dart';
import 'frontend/Welcome/welcome.dart';

Future<void> main() async {
  // Disclaimer: it happen that there is not but one question about art in the database
  WidgetsFlutterBinding.ensureInitialized(); // Initialize Flutter

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: 'codsoft-wisdom-wave-63d82');

  // Adding Questions to the Database just for the reference and they are already saved in the Data Class

  // FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  // for(int i=0;i<Data.questions.length;i++){
  //   await _dbRef.child('questions').child('question_$i').set(Data.questions[i]);
  // }
  // List<Map<dynamic, dynamic>> randomQuestions = await AccessDB.getRandomQuestions("literature", 5);
  //
  // print("Randomly selected literature questions:");
  // for (var question in randomQuestions) {
  //   print("Question: ${question['question']}");
  //   print("Options: ${question['options']}");
  //   print("Correct Answer: ${question['correctAnswer']}");
  //   print("Category: ${question['category']}");
  //   print("-------------------------------");
  // }

  // List<dynamic> categoriesData = await AccessDB.getCategories();
  // final categories = Set.of(categoriesData);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //driver in the main.dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        //routes for smoother navigation
        '/': (context) => const Welcome(),
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/home': (context) => const Home(),
        '/quiz': (context)=> Quiz(),
        '/resetPass': (context) => ResetPassword(),
      },
    );
  }
}
