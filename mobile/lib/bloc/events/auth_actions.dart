import 'package:flutter/material.dart';

abstract class AuthActions {}

class LoggedOut extends AuthActions {}

class Loading extends AuthActions {}

class Login extends AuthActions {
  TextEditingController username;
  TextEditingController password;

  Login({required this.username, required this.password});
}

class Register extends AuthActions {
  TextEditingController username;
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController address;
  TextEditingController city;
  TextEditingController province;
  TextEditingController password;
  TextEditingController confirmPassword;

  Register(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.city,
      required this.province,
      required this.password,
      required this.confirmPassword});
}
