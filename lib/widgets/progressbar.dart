import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';

class progressbar extends StatefulWidget {
  int index = 0;
  progressbar({super.key, required this.index});

  @override
  State<progressbar> createState() => _progressbarState();
}

class _progressbarState extends State<progressbar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: height * 0.04,
              width: width * 0.08,
              margin: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: constant.progressindicator,
                  width: widget.index == 0 ? 3.0 : 1.0,
                ),
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: widget.index >= 1
                  ? Icon(
                      Icons.check,
                      color: constant.progressindicator,
                    )
                  : Icon(
                      Icons.circle,
                      color: constant.progressindicator,
                    ),
            ),
            Text(
              'Personal',
              style: TextStyle(
                fontFamily: constant.font,
                fontSize: width * 0.04,
                fontWeight:
                    widget.index == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: height * 0.03),
          height: height * 0.001,
          width: width * 0.4,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        ),
        Column(
          children: [
            Container(
                height: height * 0.04,
                width: width * 0.08,
                margin: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: constant.progressindicator,
                    width: widget.index == 1 ? 3.0 : 1.0,
                  ),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: widget.index >= 2
                    ? Icon(
                        Icons.check,
                        color: constant.progressindicator,
                      )
                    : Icon(
                        Icons.circle,
                        color: constant.progressindicator,
                      )),
            Text(
              'Business',
              style: TextStyle(
                fontFamily: constant.font,
                fontSize: width * 0.04,
                fontWeight:
                    widget.index == 1 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
