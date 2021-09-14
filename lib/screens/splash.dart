import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_flutter/utils/routes.dart';
import 'package:gdg_flutter/utils/space.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<User?> subscription;

  @override
  void initState() {
    super.initState();
    this.subscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user != null) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else {
            Navigator.pushReplacementNamed(context, AppRoutes.signup);
          }
        });
  }

  @override
  void dispose() {
    this.subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('images/app-logo.png')),
            SizedBox(height: Space.x3),
            Text("Welcome to Job Posting App"),
          ],
        ),
      ),
    );
  }
}