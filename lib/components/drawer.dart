import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/main.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Counter'),
          onTap: () {
            // Route ke main
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home',)),
            );
          },
        ),
     ],
    ),
  );
}