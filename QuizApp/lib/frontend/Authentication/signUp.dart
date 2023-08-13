import 'package:flutter/material.dart';

import '../Components/QAElevatedButton.dart';
import '../Components/QATextFormField.dart';
import '../style/colors.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confPassCtrl = TextEditingController();

  bool _isSaving = false;

  void _saveForm() {}

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
        child: ListView(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
            QATextFormField(
              controller: nameCtrl,
              labelText: 'Name',
              hintText: 'enter your name',
              enabled: !_isSaving,
            ),
            QATextFormField(
              controller: mailCtrl,
              labelText: 'Email',
              hintText: 'enter your email address',
              enabled: !_isSaving,
            ),
            QATextFormField(
                enabled: !_isSaving,
                controller: passCtrl,
                labelText: 'Password',
                hintText: 'enter your password'),
            QATextFormField(
                enabled: !_isSaving,
                controller: passCtrl,
                labelText: 'Confirm Password',
                hintText: 'enter your password again'),
            QAElevatedButton(
              onPressed: () => {
                // TODO signIn logic here
              },
              buttonText: 'Sign Up',
              color: MyColors.myPrimaryPink,
              textColor: MyColors.myBlack,
            ),
            Container(
              height: 20.0,
              margin: const EdgeInsets.only(top: 70.0),
              child: Text('Already have an account', style: TextStyle(color: MyColors.myBlack, fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),
            QAElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/signIn')},
              buttonText: 'Sign In',
              color: MyColors.myBlack,
              textColor: MyColors.myPrimaryPink,
            )
          ],
        ),
      ),
    );
  }
}
