import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuth {
  static Future<void> signUp(
      String email, String password, String name, BuildContext context) async {
    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await cred.user?.updateDisplayName(name);
      await cred.user?.sendEmailVerification();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'Signed up successfully, Check your email for Confirmation',
          textAlign: TextAlign.center,
        )),
      );
      Navigator.pushNamed(context, '/signIn');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'The password provided is too weak.',
            textAlign: TextAlign.center,
          )),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'The account already exists for that email.',
            textAlign: TextAlign.center,
          )),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> signIn(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
              'Signed In Successfully',
              textAlign: TextAlign.center,
            )),
      );
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }
}
