import 'package:com.codsoft.quizApp/backend/Authentication/UserAuth.dart';
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

  Future<void> _saveForm() async {
    setState(() {
      _isSaving=true;
    });
    var name = nameCtrl.text.trim();
    var mail = mailCtrl.text.trim();
    var pass = passCtrl.text.trim();
    var confPass= confPassCtrl.text.trim();
    final RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if(name.isNotEmpty && mail.isNotEmpty && pass.isNotEmpty && confPass.isNotEmpty){
      if(emailRegex.hasMatch(mail)){
        if(pass.compareTo(confPass)==0){
          await UserAuth.signUp(mail, pass, name, context);
        }
        else{ setState(() {
          _isSaving=false;
        });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                  'Passwords do not match!',
                  textAlign: TextAlign.center,
                )),
          );
        }
      }
      else{ setState(() {
        _isSaving=false;
      });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                'Please enter a valid email address',
                textAlign: TextAlign.center,
              )),
        );
      }
    }
    else{
      setState(() {
        _isSaving=false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
              'All the fields are required',
              textAlign: TextAlign.center,
            )),
      );
    }
setState(() {
  _isSaving=false;
});

  }

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
              isPassword: false,
            ),
            QATextFormField(
              controller: mailCtrl,
              labelText: 'Email',
              hintText: 'enter your email address',
              enabled: !_isSaving,
              isPassword: false,
            ),
            QATextFormField(
                enabled: !_isSaving,
                controller: passCtrl,
                isPassword: true,
                labelText: 'Password',
                hintText: 'enter your password'),
            QATextFormField(
                enabled: !_isSaving,
                isPassword: true,
                controller: confPassCtrl,
                labelText: 'Confirm Password',
                hintText: 'enter your password again'),
            _isSaving? LinearProgressIndicator(color: Colors.black,backgroundColor: MyColors.myPrimaryPink,):
            QAElevatedButton(
              onPressed: _saveForm,
              buttonText: 'Sign Up',
              color: MyColors.myPrimaryPink,
              textColor: MyColors.myBlack,
            ),
            Container(
              height: 20.0,
              margin: const EdgeInsets.only(top: 70.0),
              child: Text(
                'Already have an account',
                style: TextStyle(
                    color: MyColors.myBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
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
