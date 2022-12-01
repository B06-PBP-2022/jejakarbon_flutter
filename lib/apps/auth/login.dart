import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


class LoginPage extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";
  
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: SafeArea(
        child: Padding (
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text("Login", 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    SizedBox(height: 50),
                  ],
                ),
              )
            ]
          ),

          )
        )
    );
  }
}
