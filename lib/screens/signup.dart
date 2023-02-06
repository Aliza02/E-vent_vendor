import 'package:event_vendor/constants/constant.dart';
import 'package:event_vendor/constants/auth_method.dart';
import 'package:event_vendor/screens/business_signup.dart';
import 'package:event_vendor/screens/home.dart';
// import 'package:event_vendor/widgets/progress_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:event_vendor/widgets/passwordfield.dart';
import 'package:event_vendor/widgets/textformfield.dart';
import 'package:event_vendor/constants/constant.dart';
import 'package:event_vendor/widgets/numberfield.dart';
import 'package:progress_timeline/progress_timeline.dart';
import '../widgets/progressbar.dart';
import '../widgets/button.dart';
import '../widgets/googlebutton.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  void showErrormessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Icon(
          Icons.error,
          color: Colors.red,
          size: 50.0,
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }

  void validationPersonal() {
    if (fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty &&
        password.text == confirmPassword.text) {
      currentindex += 1;
      print(currentindex);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => business_signup(
            userName: fullName.text,
            email: email.text,
            password: password.text,
          ),
        ),
      );
      currentindex = 0;
    }

    if (password.text != confirmPassword.text &&
        fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty) {
      showErrormessage('Password and Confirm Password does not match');
    }

    if (fullName.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      showErrormessage('Enter Details to Proceed');
    }
  }

  int currentindex = 0;
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
            alignment: Alignment.center,
            width: width * 0.8,
            height: height * 0.08,
            child: progressbar(index: currentindex),
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
                validationPersonal();
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
              onPressed: validationPersonal,
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
      home: personalInfo(context),
    );
  }
}
