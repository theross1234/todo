import 'package:flutter/material.dart';
import 'package:todo_app_test/const/colors.dart';
import 'package:todo_app_test/data/auth_data.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback show;
  const LoginScreen({super.key, required this.show});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });

    super.initState();
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            image(),
            SizedBox(
              height: 50,
            ),
            textField_email(emailController, _focusNode),
            SizedBox(
              height: 10,
            ),
            textField_password(passwordController, _focusNode2),
            SizedBox(
              height: 20,
            ),
            signUp(),
            SizedBox(
              height: 20,
            ),
            login_button()
          ],
        ),
      )),
    );
  }

  Widget signUp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "SignUp",
              style: TextStyle(
                  color: c_green, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Padding textField_email(
    TextEditingController _emailController,
    FocusNode _focusNode,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: emailController,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email,
                color: _focusNode.hasFocus ? c_green : Colors.grey),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: "enter a mail",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: c_green, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }

  Padding image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: backgroundColor,
          image: DecorationImage(
            image: AssetImage('images/7.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Padding textField_password(
      TextEditingController _passwordController, FocusNode _focusNode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: _passwordController,
          focusNode: _focusNode2,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.password,
                color: _focusNode2.hasFocus ? c_green : Colors.grey),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: "enter your password",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: c_green, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget login_button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote()
              .login(emailController.text, passwordController.text);
        },
        child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: c_green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
