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
  bool _isFav = false;
  bool test = false;

  @override
  void initState() {
    super.initState();
    _loadRandomQuote().then((value) => print('getting quote'));
    Stream.periodic(const Duration(minutes: 1), (int count) => count)
        .asyncMap((_) async => await AccessDB.getRandomQuote())
        .listen((quote) {
      AccessDB.isFavoriteByUser(quote).then((value) {
        setState(() {
          _isFav = value;
        });
      });
      print(_isFav);
      setState(() {
        _currentQuote = quote;
      });
      _quoteStream.add(quote);
    });

    AccessDB.isFavoriteByUser(
            'Let your actions speak the words your heart wishes to convey.')
        .then((value) => test = value);
    print(test);
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
  }

  void favoriteQuote() {
    if (!_isFav) {
      setState(() {
        _isFav = true;
      });
      AccessDB.quoteFavorite(_currentQuote, true);
    } else {
      setState(() {
        _isFav = false;
      });
      AccessDB.quoteFavorite(_currentQuote, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Color.fromARGB(255, 194, 90, 124)),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.settings,
              color: Color.fromARGB(255, 194, 90, 124),
            ),
            color: Colors.pinkAccent.shade100,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'favs',
                  child: Text(
                    'Favorites',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
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
            onSelected: (value) async {
              var email = FirebaseAuth.instance.currentUser?.email;
              if (value.compareTo('signout') == 0) {
                Auth.signOut(context);
              } else if (value.compareTo('resetPass') == 0) {
                Auth.resetPassword(email!, context);
              } else {
                var removedQuote = await Navigator.pushNamed(context, '/favs');
                if (removedQuote != null) {
                  print(removedQuote);
                  if (removedQuote == _currentQuote) {
                    setState(() {
                      _isFav = false;
                    });
                  }
                }
              }

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
                margin: const EdgeInsets.only(top: 150, left: 50, right: 50),
                padding: const EdgeInsets.only(
                    top: 40, right: 30, left: 30, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  children: [
                    _waiting
                        ? const CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            color: Color.fromARGB(255, 194, 90, 124),
                          )
                        : StreamBuilder<String>(
                            stream: _quoteStream.stream,
                            initialData: _currentQuote,
                            builder: (context, snapshot) {
                              final displayedQuote =
                                  snapshot.data ?? _currentQuote;

                              return Text(
                                displayedQuote,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'quote', fontSize: 20),
                              );
                            },
                          ),
                    IconButton(
                        onPressed: favoriteQuote,
                        icon: Icon(
                          _isFav ? Icons.favorite : Icons.favorite_border,
                          color:
                              _isFav ? Colors.pinkAccent : Colors.grey.shade600,
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
