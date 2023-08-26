import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import '../Authentication/auth.dart';
import '../Database/AccessDB.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _currentQuote = "No quote is pulled";
  BehaviorSubject<String> _quoteStream = BehaviorSubject<String>();
  bool _waiting = false;

  @override
  void initState() {
    super.initState();
    _loadRandomQuote().then((value) => print('getting quote'));

    // Generate a new quote every 24 hours
    Stream.periodic(Duration(hours: 24), (int count) => count)
        .asyncMap((_) async => await AccessDB.getRandomQuote())
        .listen((quote) {
      _quoteStream.add(quote);
    });
  }

  @override
  void dispose() {
    _quoteStream.close();
    super.dispose();
  }

  Future<void> _loadRandomQuote() async {
    setState(() {
      _waiting = true;
    });
    String quote = await AccessDB.getRandomQuote();
    setState(() {
      _currentQuote = quote;
      _waiting = false;
    });
    print('done: $quote');
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
        ],
      ),
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
              child: _waiting
                  ? const CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      color: Colors.pinkAccent,
                    )
                  : StreamBuilder<String>(
                      stream: _quoteStream.stream,
                      initialData: _currentQuote,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'quote', fontSize: 20),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
