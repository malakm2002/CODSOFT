import 'package:flutter/material.dart';
import '../Components/QAElevatedButton.dart';
import '../style/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        width: 410,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [MyColors.myBlack, MyColors.myPrimaryPink],
                stops: [0.0, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 400,
              width: 300,
            ),
            Container(
              width: 350,
              child: const Text(
                "Welcome to",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'retro',
                  // fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              width: 350,
              child: const Text(
                "Wisdom Wave",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'retro',
                  fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic
                ),
              ),
            ),
            Container(
              width: 350,
              margin: const EdgeInsets.only(top: 30.0),
              child: const Text(
                "Surf Through Knowledge with Our Engaging Quiz App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'retro',
                  // fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic
                ),
              ),
            ),
           QAElevatedButton(buttonText: 'Let\'s Get Started', onPressed: ()=>Navigator.pushNamed(context, '/home'), color: MyColors.myBlack,textColor: MyColors.myPrimaryPink,)
          ],
        ),
      ),
    );
  }
}
