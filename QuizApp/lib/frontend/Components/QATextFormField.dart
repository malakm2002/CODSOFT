import 'package:flutter/material.dart';

import '../style/colors.dart';

class QATextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool enabled;



  const QATextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.enabled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0, bottom: 10.0),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        cursorColor: MyColors.myPrimaryPink,
        cursorHeight: 25.0,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: MyColors.myPrimaryPink, fontSize: 18),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
