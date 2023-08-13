import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: MyColors.myBlack),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.myPrimaryPink,
        actions: [
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.settings,
                color: MyColors.myBlack,
              ))
        ],
      ),
    );
  }
}
