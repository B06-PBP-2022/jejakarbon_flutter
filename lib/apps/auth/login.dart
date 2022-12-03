// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/main.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:jejakarbon_flutter/components/drawer.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
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
        appBar: AppBar(
          title: const Text("Login"),
        ),
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Form(
                  key: _loginFormKey,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Insert username',
                                labelText: 'Username',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 10)),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  username = value;
                                });
                              },
                              onSaved: (String? value) {
                                username = value!;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Username tidak boleh kosong";
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5)),
                          child: TextFormField(
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Type password',
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 10)),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                password1 = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                password1 = value!;
                              });
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password tidak boleh kesing";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () async {
                final response = await request.login(
                    "https://jejakarbon.up.railway.app/auth/login/",
                    {'username': username, 'password': password1});
                if (request.loggedIn) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Successfully logged in!"),
                  ));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: 'Home')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("An error occured, please try again."),
                  ));
                }
              },
              child: const Text(
                'login',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }
}
