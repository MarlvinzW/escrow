import 'package:escrow_mobile/utils/contstants.dart';
import 'package:flutter/material.dart';


// todo : sign up screen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text('Sign Up',
              style: TextStyle(color: Constants.appColor)),
        ));
  }
}
