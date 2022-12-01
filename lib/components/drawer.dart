import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/main.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_page.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/open_donasi_page.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Home'),
          onTap: () {
            // Route ke main
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                        title: 'Home',
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Faq'),
          onTap: () {
            // Route ke main
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FaqPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Buka Donasi'),
          onTap: () {
            // Route ke main
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BukaDonasiPage()),
            );
          },
        ),
      ],
    ),
  );
}
