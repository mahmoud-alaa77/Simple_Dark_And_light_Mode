import 'package:flutter/material.dart';

class AppTheme {
  
static final ThemeData lightMode = ThemeData(
  primaryColor: Colors.amber,
appBarTheme: const AppBarTheme(
  backgroundColor: Colors.white,
  titleTextStyle:  TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.bold
  ),
),
brightness: Brightness.light
);



static final ThemeData darkMode = ThemeData(
    primaryColor: Colors.grey,

appBarTheme: const AppBarTheme(
  backgroundColor: Colors.black,
  titleTextStyle:  TextStyle(
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.bold
  ),
),
brightness: Brightness.dark

);

}