import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 60.0, right: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 300,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0, bottom: 50.0),
              child: const Text(
                'Welcome to WordAlChemy',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'retro',
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/signIn')},
              child: const Text(
                'Let\'s Get Started',
                style: TextStyle(color: Colors.black, fontSize: 23),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 194, 90, 124),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, right: 40, left: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
