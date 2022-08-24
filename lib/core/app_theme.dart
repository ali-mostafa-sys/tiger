import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


final primaryColor = HexColor('#3C3544');
final fillTextFormColor=HexColor("#C5C5C5");



final appTheme=ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,

  /// text form field theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor:fillTextFormColor ,
    filled: true,
    errorMaxLines: 3,
    
    labelStyle: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),
    floatingLabelStyle: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(22),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(22),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: BorderSide(style: BorderStyle.solid,width: 1,color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(22),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(22),
    ),
    prefixIconColor: primaryColor,
    suffixIconColor: primaryColor,
  ),
  ///icons theme
  iconTheme: IconThemeData(color:primaryColor ),

);