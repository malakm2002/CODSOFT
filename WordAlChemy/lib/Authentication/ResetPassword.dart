import 'package:com.codsoft.quizApp/backend/Authentication/UserAuth.dart';
import 'package:com.codsoft.quizApp/frontend/Components/QAElevatedButton.dart';
import 'package:com.codsoft.quizApp/frontend/Components/QATextFormField.dart';
import 'package:com.codsoft.quizApp/frontend/Style/colors.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController mailCtrl = TextEditingController();
  bool _isSending = false;

  Future<void> ResetPass() async {
    setState(() {
      _isSending = true;
    });
    await UserAuth.resetPassword(mailCtrl.text.trim(), context);
    setState(() {
      _isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: TextStyle(color: MyColors.myBlack),
        ),
        backgroundColor: MyColors.myPrimaryPink,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [MyColors.myBlack, MyColors.myPrimaryPink],
                stops: [0.0, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          children: [
            QATextFormField(
                controller: mailCtrl,
                labelText: 'Email',
                hintText: 'enter your email address',
                enabled: true,
                isPassword: false),
            _isSending
                ? LinearProgressIndicator(
                    color: MyColors.myPrimaryPink,
                    backgroundColor: MyColors.myBlack,
                  )
                : QAElevatedButton(
                    onPressed: ResetPass,
                    buttonText: 'Reset',
                    color: MyColors.myPrimaryPink,
                    textColor: MyColors.myBlack)
          ],
        ),
      ),
    );
  }
}
