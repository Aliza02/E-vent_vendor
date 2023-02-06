import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_vendor/constants/constant.dart';
import 'package:event_vendor/constants/auth_method.dart';
import 'package:event_vendor/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:event_vendor/widgets/passwordfield.dart';
import 'package:event_vendor/widgets/textformfield.dart';
import 'package:event_vendor/constants/constant.dart';
import 'package:event_vendor/widgets/numberfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/progressbar.dart';
import '../widgets/button.dart';
import '../widgets/googlebutton.dart';

class business_signup extends StatefulWidget {
  String userName, email, password;
  business_signup(
      {super.key,
      required this.userName,
      required this.email,
      required this.password});

  @override
  State<business_signup> createState() => _business_signupState();
}

class _business_signupState extends State<business_signup> {
  final TextEditingController businessName = TextEditingController();
  final TextEditingController businessType = TextEditingController();
  final TextEditingController businessLocation = TextEditingController();
  final TextEditingController cnic = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();
  var selected;
  int currentindex = 1;
  bool loading = false;

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

  final business_type = [
    'Venue',
    'Caterers',
    'Photographer',
    'Florist',
    'Card Printing',
    'Decorators',
    'Others',
  ];

  void validationBusiness() async {
    if (businessName.text.isNotEmpty &&
        businessType.text.isNotEmpty &&
        businessLocation.text.isNotEmpty &&
        cnic.text.isNotEmpty &&
        contactNumber.text.isNotEmpty) {
      currentindex += 1;
      setState(() {
        loading = true;
      });

      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: widget.email, password: widget.password);
        User user = userCredential.user!;

        await firestore.collection('users').doc(user.uid).set({
          'email': widget.email,
          'uid': user.uid,
          'password': widget.password,
          'fullName': widget.userName,
          'businessName': businessName,
          'businessType': businessType,
          'businessLocation': businessLocation,
          'cnic': cnic,
          'contactNumber': contactNumber,
        });

        if (user != null) {
          Navigator.pushNamed(context, '/home');
        }
      } on FirebaseAuthException catch (e) {
        print(e.message);
      }

      currentindex = 0;
      setState(() {
        loading = false;
      });
    }

    if (contactNumber.text.length < 11 &&
        businessName.text.isNotEmpty &&
        businessType.text.isNotEmpty &&
        businessLocation.text.isNotEmpty &&
        cnic.text.isNotEmpty) {
      showErrormessage('Enter valid contact number');
    }

    if (businessName.text.isEmpty ||
        businessType.text.isEmpty ||
        businessLocation.text.isEmpty ||
        cnic.text.isEmpty ||
        contactNumber.text.isEmpty) {
      showErrormessage('Enter complete detail to proceed');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFF7ED),
      body: loading == true
          ? Center(
              child: SpinKitChasingDots(
                color: Color(0xFFFF57366),
                size: 100.0,
              ),
            )
          : Column(
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
                currentindex >= 1
                    ? Container(
                        width: width * 0.8,
                        height: height * 0.08,
                        child: progressbar(index: currentindex),
                      )
                    : Container(),
                Container(
                  width: width * 0.8,
                  margin: EdgeInsets.symmetric(vertical: height * 0.018),
                  child: textformfield(
                    title: 'Business Name',
                    textcontroller: businessName,
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
                      items: business_type
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        selected = val as String;
                        businessType.text = selected;
                      }),
                ),
                Container(
                  width: width * 0.8,
                  margin: EdgeInsets.symmetric(vertical: height * 0.018),
                  child: textformfield(
                    title: 'Business Location',
                    textcontroller: businessLocation,
                  ),
                ),
                Container(
                  width: width * 0.8,
                  margin: EdgeInsets.symmetric(vertical: height * 0.018),
                  child: numberfield(
                    title: 'CNIC',
                    numbercontroller: cnic,
                  ),
                ),
                Container(
                  width: width * 0.8,
                  margin: EdgeInsets.symmetric(vertical: height * 0.018),
                  child: numberfield(
                    title: 'Contact Number',
                    numbercontroller: contactNumber,
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
                      validationBusiness();
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
}
