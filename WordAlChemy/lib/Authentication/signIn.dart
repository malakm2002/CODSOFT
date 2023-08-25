import 'package:flutter/material.dart';
import 'package:word_alchemy/Authentication/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  bool _isSigningIn = false;

  Future<void> signIn() async {
    setState(() {
      _isSigningIn = true;
    });
    String email = mailCtrl.text.trim();
    String password = passCtrl.text.trim();
    await Auth.signIn(email, password, context);
    setState(() {
      _isSigningIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Image.asset(
            'assets/logo.png',
            height: 200,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            width: 200.0,
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
          Container(
            margin: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 25.0, bottom: 25.0),
            width: 200.0,
            child: TextFormField(
              obscureText: true,
              controller: passCtrl,
              cursorColor: Colors.pinkAccent,
              decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.pinkAccent),
                  hintText: 'enter your password',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pinkAccent))),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60.0),
            child: _isSigningIn
                ? const LinearProgressIndicator(
                    backgroundColor: Colors.pinkAccent,
                    color: Colors.black,
                  )
                : ElevatedButton(
                    onPressed: signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 40, left: 40),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    ),
                  ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/resetPass');
                },
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60.0),
            child: ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, '/signUp')},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, right: 40, left: 40),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.pinkAccent, fontSize: 23),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
