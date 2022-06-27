import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const headerTextStyle = TextStyle(
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: Colors.white);

  static const subHeaderTextStyle = TextStyle(
      fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold, fontSize: 24);

  static const defaultTextStyle = TextStyle(
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: Color.fromARGB(188, 0, 0, 0));

  static const navBarStyle = TextStyle(
      fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold, fontSize: 18);
}
