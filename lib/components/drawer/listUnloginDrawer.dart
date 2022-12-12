// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/auth/register.dart';
import 'package:jejakarbon_flutter/apps/auth/login.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_page.dart';
import 'package:jejakarbon_flutter/apps/profile/page/profile_page.dart';

class MyListUnloginDrawer extends StatefulWidget {
  const MyListUnloginDrawer({super.key});

  @override
  _MyListUnloginDrawerState createState() => _MyListUnloginDrawerState();
}

class _MyListUnloginDrawerState extends State<MyListUnloginDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.question_answer),
          title: const Text('FAQ'),
          onTap: () {
            // Route ke faq page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FaqPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('login'),
          onTap: () {
            // Route ke login page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.app_registration),
          title: const Text('Register'),
          onTap: () {
            // Route ke register page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RegisterPage()),
            );
          },
        ),
      ],
    );
  }
}
