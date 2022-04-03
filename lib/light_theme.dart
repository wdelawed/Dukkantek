import 'package:flutter/material.dart';

class MyTheme {
  static const Color accent = Color(0xff8f7fad);
  static const Color primary = Color(0xFF662c92);
  static const Color secondary = Color(0xff557275);
  static const Color disabled = Color(0xffD8D8D8);
  static const Color focused = Color(0xFF5A2186);
  static const Color error = Color(0xffFF8080);
  static var light = ThemeData(
    // textTheme: TextTheme(bodyText1: TextStyle(fontFamily: "Cairo", fontSize: 12, color: primary)),
    backgroundColor: Colors.white,
    snackBarTheme:
        SnackBarThemeData(contentTextStyle: TextStyle(fontFamily: "Cairo")),
    accentColor: accent,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
        return TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: "Cairo");
      }),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
              side: BorderSide(color: Colors.transparent))),
      minimumSize:
          MaterialStateProperty.resolveWith<Size>((Set<MaterialState> states) {
        return Size(125, 48);
      }),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) return focused;
        return primary;
      }),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.white;
      }),
    )),
    fontFamily: "Cairo",
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      focusColor: Colors.white,
      filled: true,
      hintStyle: TextStyle(
          color: Color(0xffB6B6B6), fontSize: 10, fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.transparent, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: primary, width: 2)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: error, width: 2)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: error, width: 1)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
      labelStyle: TextStyle(
          color: primary, fontSize: 12, fontWeight: FontWeight.normal),
    ),
    primaryColorDark: focused,
    primaryColor: primary,
    buttonTheme: ButtonThemeData(
        focusColor: focused,
        disabledColor: disabled,
        buttonColor: primary,
        height: 49,
        minWidth: 125,
        textTheme: ButtonTextTheme.normal),
  );
}
