import 'package:event_vendor/constants/auth_method.dart';
import 'package:event_vendor/widgets/button.dart';
import 'package:event_vendor/widgets/googlebutton.dart';
import 'package:event_vendor/widgets/passwordfield.dart';
import 'package:event_vendor/widgets/textformfield.dart';
import 'package:event_vendor/constants/constant.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    void validation() {
      if (email.text.isNotEmpty && password.text.isNotEmpty) {
        Signin(email: email.text, password: password.text);
        Navigator.pushNamed(context, '/home');
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFF0FBFB),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.18,
              child: Text(
                'Sign in',
                style: TextStyle(
                  fontFamily: constant.font,
                  fontSize: width * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Text(
                'Welcome back you’ve been missed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.058,
                  fontFamily: constant.font,
                ),
              ),
            ),
            Container(
              width: width * 0.8,
              margin: EdgeInsets.symmetric(vertical: height * 0.05),
              child: textformfield(
                title: 'Email Address',
                textcontroller: email,
              ),
            ),
            Container(
              width: width * 0.8,
              child: PasswordField(
                title: 'Password',
                passwordcontroller: password,
              ),
            ),
            Container(
              width: width * 0.8,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontFamily: constant.font,
                  fontSize: width * 0.04,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              width: width * 0.8,
              height: height * 0.09,
              margin: EdgeInsets.symmetric(vertical: height * 0.04),
              child: Button(
                name: 'Log in',
                bgColor: 0xFFF45C1C1,
                onPressed: validation,
              ),
            ),
            Container(
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
              margin: EdgeInsets.fromLTRB(0.0, height * 0.02, 0.0, 0.0),
              alignment: Alignment.center,
              child: GoogleButton(
                  name: 'Login with Google',
                  bgColor: 0xFFFFFFFFF,
                  onPressed: validation),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Color(0xFFFABA4A4),
                      fontFamily: constant.font,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign up',
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
      ),
    );
  }
}
