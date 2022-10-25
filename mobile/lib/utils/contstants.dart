import 'package:flutter/material.dart';

class Constants {
  static const serverUrl = 'https://test.dreamhub.co.zw';
  static const baseUrl = '$serverUrl/api/v1/';
  static const appName = 'Escrow';
  static const appColor = Colors.blueAccent;
  static const badRequestCode = 400;
  static const notFoundCode = 404;
  static const connectionError = 'Connection error, please try again later';
  static const invalidFormMessage = 'Please correct the details above';
  static const transitionDelay = 200;
  static formTextStyle() => const TextStyle(
      fontSize: 12.0, color: appColor, fontWeight: FontWeight.normal);
}
