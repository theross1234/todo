import 'package:flutter/material.dart';
import 'package:todo_app_test/screen/login.dart';
import 'package:todo_app_test/screen/signup.dart';

class Auth_page extends StatefulWidget {
  const Auth_page({super.key});

  @override
  State<Auth_page> createState() => _Auth_pageState();
}

class _Auth_pageState extends State<Auth_page> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginScreen(
        show: to,
      );
    } else {
      return SignUpScreen(
        show: to,
      );
    }
  }
}
