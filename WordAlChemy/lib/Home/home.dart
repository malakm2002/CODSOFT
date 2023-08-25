import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:word_alchemy/Database/AccessDB.dart';

import '../Authentication/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String quote = "no quote was pulled";
  late SharedPreferences _prefs;
  late DateTime _lastDisplayedDate;

  @override
  void initState(){
    super.initState();
    _lastDisplayedDate = DateTime.now();
    _initSharedPreferences().then((value) => print('prefs initialized!!'));
  }

  Future<void> _initSharedPreferences() async {
    print('init prefs');
    _prefs = await SharedPreferences.getInstance();
    final storedTimestamp = _prefs.getInt('lastDisplayedTimestamp') ?? 0;
    _lastDisplayedDate = DateTime.fromMillisecondsSinceEpoch(storedTimestamp);
    String q = await _updateQuoteIfNeeded();
    print('quote: $q');
  }

  Future<String> _updateQuoteIfNeeded() async {
    String newQuote = "New Quote";
    final currentDate = DateTime.now();

    try {
      if (_lastDisplayedDate.year != currentDate.year ||
          _lastDisplayedDate.month != currentDate.month ||
          _lastDisplayedDate.day != currentDate.day) {
        newQuote = await AccessDB.getRandomQuote();
        setState(() {
          quote = newQuote;
        });
        print('setting the new quote: $quote');
        _prefs.setInt(
            'lastDisplayedTimestamp', currentDate.millisecondsSinceEpoch);
      }
    } catch (error) {
      print('Error updating quote: $error');
    }

    return newQuote;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.pinkAccent),
          ),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.settings,
                color: Colors.pinkAccent,
              ),
              color: Colors.pinkAccent.shade100,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: 'resetPass',
                    child: Text(
                      'Reset Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'signOut',
                    child: Text(
                      'Sign Out',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                var email = FirebaseAuth.instance.currentUser?.email;
                value.compareTo('signOut') == 0
                    ? Auth.signOut(context)
                    : Auth.resetPassword(email!, context);

                print('Selected: $value');
              },
            ),
          ]),
      body: Container(
        width: 410,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, left: 50, right: 50),
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.shade300,
              ),
              child: FutureBuilder<String>(
                future: _updateQuoteIfNeeded(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      color: Colors.pinkAccent,
                      backgroundColor: Colors.black,
                    );
                  } else if (snapshot.hasError) {
                    return const Icon(
                      Icons.error,
                      color: Colors.pinkAccent,
                      size: 30,
                    );
                  } else {
                    return Text(
                      quote,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'quote', fontSize: 20),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
