import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    appBarTheme: AppBarTheme(foregroundColor: Colors.black, centerTitle: true),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}
// class MyTheme{
//   static ThemeData get lightTheme => ThemeData(
//     primarySwatch: Colors.deepPurple,
//     appBarTheme: AppBarTheme(foregroundColor: Colors.black),
//     fontFamily: GoogleFonts.lato().fontFamily,
//   );
// }
