
import 'package:flutter/material.dart';

const accentColor = Color(0xFFDC631F);
const yellow = Color(0xFFFFC426);
const yellowLight = Color(0xFFFFD564);
const primaryColor = Color(0xFF034D18);
const primaryAccent = Color(0xFF006648);
const lightGreen = Color(0xFF49B421);
const primaryLight = Color(0xFF95D3BC);
const darkColor = Color(0xFF121212);
const darkGrayColor = Color(0xFF333333);
const lightGrayColor = Color(0xFF555555);
const grayish = Color(0xFF707070);
const accentGrayColor = Color(0xFF888888);
const gray = Color(0xFFAAAAAA);
const grayBg = Color(0xFFDDDDDD);
const darkWhite = Color(0xFFCCCCCC);
const lightWhite = Color(0xFFF2F2F2);
const almostWhite = Color(0xFFE5E5E5);
const lightBlue = Color(0xFFE7F4EF);
const white = Color(0xFFFFFFFF);
const littleWhite = Color(0xFFF7f7f7);
const lightPink = Color(0xffF5E7D8);
const darkPink = Color(0xffEDD3B9);
const errorTextColor = Color(0xffAA0000);
const errorBorder = Color(0xffFF0000);
const deleteColor = Color(0xffFF4E4E);

var theme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: primaryColor,
  accentColor: accentColor,

  // Define the default font family.
  fontFamily: 'Noway',
  textTheme: TextTheme(
    bodyText1: TextStyle(color: white)
  )
);