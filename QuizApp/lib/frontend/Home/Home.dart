import 'dart:math';

import 'package:com.codsoft.quizApp/backend/Authentication/UserAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../Components/QAElevatedButton.dart'; // Update with the correct import path

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = 'literature'; // Default selected category
  bool isDropdownVisible = false; // Initially, the dropdown is not visible

  List<String> categories = ['literature', 'science', 'history', 'art'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.myPrimaryPink,
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.settings,
              color: MyColors.myBlack,
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
              value.compareTo('signOut')==0?
                  UserAuth.signOut(context)
                  :UserAuth.resetPassword(email!, context);

              print('Selected: $value');
            },
          ),
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
              onPressed: () {
                setState(() {
                  isDropdownVisible = !isDropdownVisible; // Toggle visibility
                });
              },
              buttonText: 'Choose Quiz Category',
              color: MyColors.myPrimaryPink,
              textColor: MyColors.myBlack,
            ),
            Visibility(
              visible: isDropdownVisible,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Select a category:',
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButton<String>(
                    hint: const Text('Select Category'),
                    autofocus: true,
                    borderRadius: BorderRadius.circular(40.0),
                    alignment: Alignment.center,
                    dropdownColor: Colors.white,
                    style:
                        TextStyle(color: MyColors.myPrimaryPink, fontSize: 20),
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  QAElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz',
                          arguments: selectedCategory);
                      print('Selected category: $selectedCategory');
                    },
                    buttonText: 'Start Quiz',
                    color: Colors.pinkAccent.shade100,
                    textColor: MyColors.myBlack,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            QAElevatedButton(
              onPressed: () {
                int randomIndex = Random().nextInt(categories.length);
                String randomCategory = categories[randomIndex];
                Navigator.pushNamed(context, '/quiz',
                    arguments: randomCategory);
              },
              buttonText: 'Start Random Quiz',
              color: MyColors.myPrimaryPink,
              textColor: MyColors.myBlack,
            ),
          ],
        ),
      ),
    );
  }
}
