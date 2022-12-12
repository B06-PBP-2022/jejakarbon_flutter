// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/auth/register.dart';
import 'package:jejakarbon_flutter/components/footer/footer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:footer/footer_view.dart';
import 'package:jejakarbon_flutter/apps/homepage/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 96, 183, 88),
                  Color.fromARGB(255, 130, 230, 126),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      drawer: buildDrawer(context),
      body: FooterView(
        footer: buildFooter(context),
        children: [
          SingleChildScrollView(
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
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(100, 40)),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                onPressed: () async {
                  final response = await request.login(
                      "https://jejakarbon.up.railway.app/auth/login/",
                      {'username': username, 'password': password1});
                  if (request.loggedIn) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Successfully logged in! Welcome ${request.getJsonData()['name']} :)"),
                    ));

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage(title: 'Home')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Incorrect Username or Password."),
                    ));
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Belum memiliki akun?',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text(
                  ' Register',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
