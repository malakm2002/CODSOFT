import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:word_alchemy/Authentication/ResetPassword.dart';
import 'package:word_alchemy/Authentication/signIn.dart';
import 'package:word_alchemy/Authentication/signUp.dart';
import 'package:word_alchemy/Database/AccessDB.dart';
import 'package:word_alchemy/Home/favorites.dart';
import 'Home/Welcome.dart';
import 'Home/home.dart';
import 'firebase_options.dart';

void main() async {
  print('started running the application!!!!');

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // await AccessDB.addQuotes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => const Welcome(),
      '/signIn': (context) => const SignIn(),
      '/signUp': (context) => const SignUp(),
      '/resetPass': (context) => ResetPassword(),
      '/home': (context) => const Home(),
      '/favs': (context) => Favorites()
    });
  }
}
