import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:event_vendor/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:event_vendor/widgets/passwordfield.dart';
import 'package:event_vendor/widgets/textformfield.dart';
import 'package:event_vendor/constants/constant.dart';
import 'package:event_vendor/widgets/numberfield.dart';
import 'package:im_stepper/stepper.dart';
import 'package:progress_timeline/progress_timeline.dart';

import '../widgets/button.dart';
import '../widgets/googlebutton.dart';

class signupPersonalInfo extends StatefulWidget {
  const signupPersonalInfo({super.key});

  @override
  State<signupPersonalInfo> createState() => _signupPersonalInfoState();
}

class _signupPersonalInfoState extends State<signupPersonalInfo> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final mylist = ['abc', 'xyz'];
  var selected = 'abc';
  late ProgressTimeline progressTimeline;
  var stateName = 'personal';

  List<SingleState> states = [
    SingleState(stateTitle: 'Personal'),
    SingleState(stateTitle: 'Business'),
    SingleState(stateTitle: 'Sign Up'),
  ];

  void initState() {
    progressTimeline = ProgressTimeline(
      states: states,
      iconSize: 25.0,
      checkedIcon: Icon(Icons.check_circle, color: Colors.orange[700]),
      connectorColor: Colors.grey[300],
      connectorWidth: 3.0,
      connectorLength: 100.0,
      currentIcon: Icon(Icons.circle, color: Colors.orange[700]),
      uncheckedIcon: Icon(
        Icons.circle_outlined,
        color: Colors.orange[700],
      ),
    );

    super.initState();
  }

  void validation() {
    print('hello');
    // print(width * 0.058);
  }

  Widget personalInfo(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFF7ED),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.0, height * 0.0, 0.0, 0.0),
            alignment: Alignment.center,
            height: height * 0.1,
            child: Text(
              'Create Account',
              style: TextStyle(
                fontFamily: constant.font,
                fontSize: width * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: width * 0.8,
            height: height * 0.08,
            child: progressTimeline,
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: textformfield(
              title: 'Full Name',
              textcontroller: fullName,
            ),
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: textformfield(
              title: 'Email Address',
              textcontroller: email,
            ),
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: PasswordField(
              title: 'Password',
              passwordcontroller: password,
            ),
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: PasswordField(
              title: 'Confirm Password',
              passwordcontroller: confirmPassword,
            ),
          ),
          Container(
            width: width * 0.8,
            height: height * 0.09,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: Button(
              name: 'Next',
              bgColor: 0xFFFF57366,
              onPressed: () {
                progressTimeline.gotoNextStage();
                print("sada");
                print(states[0].stateTitle);
                setState(() {
                  stateName = 'Business';
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.01),
            alignment: Alignment.center,
            child: Text(
              '-OR-',
              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.grey,
                fontFamily: constant.font,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, height * 0.0, 0.0, 0.0),
            alignment: Alignment.center,
            child: GoogleButton(
              name: 'Continue with Google',
              bgColor: 0xFFFFFFFFF,
              onPressed: validation,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Color(0xFFFABA4A4),
                    fontFamily: constant.font,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Color(0xFFFF57366),
                      fontFamily: constant.font,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget businessInfo(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFF7ED),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.0, height * 0.0, 0.0, 0.0),
            alignment: Alignment.center,
            height: height * 0.1,
            child: Text(
              'Create Account',
              style: TextStyle(
                fontFamily: constant.font,
                fontSize: width * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: width * 0.8,
            height: height * 0.08,
            child: progressTimeline,
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: textformfield(
              title: 'Business Name',
              textcontroller: fullName,
            ),
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: 'Business Type',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: constant.font,
                    fontSize: width * 0.045,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                // value: selected,
                items: mylist
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  selected = val as String;
                }),
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: textformfield(
              title: 'Business Location',
              textcontroller: email,
            ),
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: numberfield(
              title: 'CNIC',
              numbercontroller: email,
            ),
          ),
          Container(
            width: width * 0.8,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: numberfield(
              title: 'Contact Number',
              numbercontroller: email,
            ),
          ),
          Container(
            width: width * 0.8,
            height: height * 0.09,
            margin: EdgeInsets.symmetric(vertical: height * 0.018),
            child: Button(
              name: 'Create Account',
              bgColor: 0xFFFF57366,
              onPressed: () {
                progressTimeline.gotoNextStage();
                print("sada");
                print(states[0].stateTitle);
                setState(() {
                  stateName = 'Business';
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Color(0xFFFABA4A4),
                    fontFamily: constant.font,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Color(0xFFFF57366),
                      fontFamily: constant.font,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: stateName == 'personal'
          ? personalInfo(context)
          : businessInfo(context),
    );
  }
}
