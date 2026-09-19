import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute3);
      setState(() {
        changeButton = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 50),
                SvgPicture.asset(
                  'assets/images/login_image.svg',
                  width: 180,
                  height: 300,
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username Cannot be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password Cannot be empty";
                          } else if (value.length < 6) {
                            return "Cannot be shorter than 6 char";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      Material(
                        color: MyTheme.lightPurpleColor,
                        borderRadius: BorderRadius.circular(
                          changeButton ? 25 : 8,
                        ),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: changeButton ? 50 : 150,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(Icons.done, color: Colors.white)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: TextButton.styleFrom(
                      //     minimumSize: Size(130, 50),
                      //     backgroundColor: Colors.lightBlueAccent,
                      //   ),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: Text("Login", style: TextStyle(fontSize: 22)),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
