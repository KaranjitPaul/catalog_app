import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/pages/home_page1.dart';
import 'package:catalog_app/pages/home_page2.dart';
import 'package:catalog_app/pages/home_page3.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute3,
      routes: {
        MyRoutes.homeRoute1: (context) => HomePage(),
        MyRoutes.homeRoute2: (context) => HomePage2(),
        MyRoutes.homeRoute3: (context) => HomePage3(),
        MyRoutes.cartRoute:(context) => CartPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
