import 'dart:ui';

import 'package:event_vendor/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:event_user/constants/constant.dart';

class Button extends StatelessWidget {
  String name;
  int bgColor;
  final Function onPressed;
  Button({required this.name, required this.bgColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        name,
        style: TextStyle(
          fontSize: width * 0.058,
          fontFamily: constant.font,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(bgColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
