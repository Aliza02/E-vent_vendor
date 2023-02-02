import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:event_vendor/constants/constant.dart';

class numberfield extends StatefulWidget {
  TextEditingController numbercontroller;
  String title;
  numberfield({required this.title, required this.numbercontroller});

  @override
  State<numberfield> createState() => _numberfieldState();
}

class _numberfieldState extends State<numberfield> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: widget.numbercontroller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: widget.title,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontFamily: constant.font,
          fontSize: width * 0.045,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
