import 'package:flutter/material.dart';
import 'package:word_alchemy/Authentication/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confPassCtrl = TextEditingController();

  bool _isSigningUp = false;
  Future<void> signUp() async {
    setState(() {
      _isSigningUp = true;
    });
    String mail = mailCtrl.text.trim();
    String pass = passCtrl.text.trim();
    String confPass = confPassCtrl.text.trim();
    String name = nameCtrl.text.trim();
    if(pass.compareTo(confPass)==0){
      await Auth.signUp(mail, pass, name, context);
      setState(() {
        _isSigningUp = false;
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
              'Passwords don\'t match',
              textAlign: TextAlign.center,
            )),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Image.asset(
            'assets/logo.png',
            height: 200,
          ),
          const SizedBox(
            height: 25.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            width: 200.0,
            child: TextFormField(
              controller: nameCtrl,
              cursorColor: Color.fromARGB(255,194, 90, 124),
              decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Color.fromARGB(255,194, 90, 124)),
                  hintText: 'enter your name',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255,194, 90, 124)))),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            width: 200.0,
            child: TextFormField(
              controller: mailCtrl,
              cursorColor: Color.fromARGB(255,194, 90, 124),
              decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color.fromARGB(255,194, 90, 124)),
                  hintText: 'enter your email address',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255,194, 90, 124)))),
            ),
          ),
          // SizedBox(
          //   height: 15.0,
          // ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0),
            width: 200.0,
            child: TextFormField(
              obscureText: true,
              controller: passCtrl,
              cursorColor: Color.fromARGB(255,194, 90, 124),
              decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color.fromARGB(255,194, 90, 124)),
                  hintText: 'enter your password',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255,194, 90, 124)))),
            ),
          ),
          // SizedBox(
          //   height: 15.0,
          // ),
          Container(
            margin: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 15.0, bottom: 25.0),
            width: 200.0,
            child: TextFormField(
              obscureText: true,
              controller: confPassCtrl,
              cursorColor: Color.fromARGB(255,194, 90, 124),
              decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Color.fromARGB(255,194, 90, 124)),
                  hintText: 'enter your password, again',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255,194, 90, 124)))),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60.0),
            child: _isSigningUp
                ? const LinearProgressIndicator(
                    backgroundColor: Color.fromARGB(255,194, 90, 124),
                    color: Colors.black,
                  )
                : ElevatedButton(
                    onPressed: signUp,
                    style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Color.fromARGB(255,194, 90, 124), fontSize: 20),
                    ),
                  ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signIn');
                },
                child: const Text(
                  'Already have an account',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
