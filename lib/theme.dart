import "package:flutter/material.dart";
import 'package:shop_app/constants.dart';

ThemeData theme() {
  var themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Multi",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  return themeData;
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10);
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
          headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18)));
}
