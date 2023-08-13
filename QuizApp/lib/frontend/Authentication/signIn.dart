import 'package:flutter/material.dart';


import '../Components/QAElevatedButton.dart';
import '../Components/QATextFormField.dart';
import '../style/colors.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

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
              height: 300,
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
            QAElevatedButton(
              onPressed: () => {
                // TODO signIn logic here
              },
              buttonText: 'Sign In',
              color: MyColors.myBlack,
              textColor: MyColors.myPrimaryPink,
            ),
            TextButton(
                onPressed: () => {},
                child: Text(
                  'Forget Password?',
                  style: TextStyle(color: MyColors.myBlack, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 40.0,
            ),
            QAElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/signUp')},
              buttonText: 'Sign Up',
              color: MyColors.myPrimaryPink,
              textColor: MyColors.myBlack,
            )
          ],
        ),
      ),
    );
  }
}
