import 'package:flutter/material.dart';

import '../style/colors.dart';

class QAElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  const QAElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.color,
required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shadowColor: Colors.white,
          elevation: 7.0,
          padding: const EdgeInsets.only(
              top: 10.0, left: 50.0, right: 50.0, bottom: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
    );
  }
}
