import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:jejakarbon_flutter/apps/auth/login.dart';

class MyListUnloginDrawer extends StatefulWidget {
  @override
  _MyListUnloginDrawerState createState() => _MyListUnloginDrawerState();
}

class _MyListUnloginDrawerState extends State<MyListUnloginDrawer> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.login),
          title: const Text('login'),
          onTap: () {
            // Route ke login page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.app_registration),
          title: const Text('Refister'),
          onTap: () {
            // Route ke login page
          },
        )
      ],
    );
  }
}
