import 'package:com.codsoft.quizApp/frontend/Components/QAElevatedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.myPrimaryPink,
        actions: [
          IconButton(
              onPressed: () => {
                    //TODO handle settings logic
                  },
              icon: Icon(
                Icons.settings,
                color: MyColors.myBlack,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        width: 410,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            QAElevatedButton(
                onPressed: () => {},
                buttonText: 'Choose Quiz',
                color: MyColors.myPrimaryPink,
                textColor: MyColors.myBlack),
            const SizedBox(height: 50,),
            QAElevatedButton(
                onPressed: () => {},
                buttonText: 'Start Random Quiz',
                color: MyColors.myPrimaryPink,
                textColor: MyColors.myBlack)
          ],
        ),
      ),
    );
  }
}
