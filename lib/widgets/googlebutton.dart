import 'package:event_vendor/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GoogleButton extends StatelessWidget {
  String name;
  int bgColor;

  GoogleButton({required this.name, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.8,
      decoration: BoxDecoration(
        color: Color(bgColor),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/google_icon.png'),
          Text(
            name,
            style: TextStyle(
              fontSize: width * 0.058,
              fontFamily: constant.font,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
