import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    cardColor: Colors.white,
    canvasColor: creamColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ).copyWith(secondary: darkBluishColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkBluishColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(darkBluishColor),
      ),
    ),
    appBarTheme: AppBarTheme(foregroundColor: Colors.black, centerTitle: true),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ).copyWith(secondary: Colors.white),
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightPurpleColor,
      foregroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(lightPurpleColor),
      ),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Color(0xFF1E1E1E);
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightPurpleColor = Color.fromARGB(255, 145, 47, 220);
}
// class MyTheme{
//   static ThemeData get lightTheme => ThemeData(
//     primarySwatch: Colors.deepPurple,
//     appBarTheme: AppBarTheme(foregroundColor: Colors.black),
//     fontFamily: GoogleFonts.lato().fontFamily,
//   );
// }
