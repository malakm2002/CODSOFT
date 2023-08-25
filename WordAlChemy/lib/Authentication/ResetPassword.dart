
import 'package:flutter/material.dart';

import 'auth.dart';

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
    await Auth.resetPassword(mailCtrl.text.trim(), context);
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
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60.0),
        width: 410,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 25.0, bottom: 25.0),
              width: 280.0,
              child: TextFormField(
                controller: mailCtrl,
                cursorColor: Colors.pinkAccent,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.pinkAccent),
                    hintText: 'enter your email address',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pinkAccent))),
              ),
            ),
            _isSending
                ? LinearProgressIndicator(
                    color: Colors.pinkAccent,
                    backgroundColor: Colors.black,
                  )
                : Container(
              margin: const EdgeInsets.symmetric(horizontal: 60.0),
              child: ElevatedButton(
                onPressed: () => {
                  Auth.resetPassword(mailCtrl.text.trim(), context)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, right: 40, left: 40),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
