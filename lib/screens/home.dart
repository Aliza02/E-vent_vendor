import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/auth_method.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ElevatedButton(
                onPressed: () {
                  GoogleSignIn().signOut();
                  Signout();
                  Navigator.pop(context);
                },
                child: Text(FirebaseAuth.instance.currentUser!.displayName
                    .toString()))),
      ),
    );
  }
}
