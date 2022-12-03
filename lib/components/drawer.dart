import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/auth/login.dart';
import 'package:jejakarbon_flutter/apps/profile/page/profile.dart';
import 'package:provider/provider.dart';
import 'package:jejakarbon_flutter/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_page.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/open_donasi_page.dart';

Drawer buildDrawer(BuildContext context) {
  final request = context.watch<CookieRequest>();
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
            // Route ke faq page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FaqPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () {
            // Route ke main
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BukaDonasiPage()),
            );
          },
        ),
        !request.loggedIn
            ? ListTile(
                title: const Text('login'),
                onTap: () {
                  // Route ke login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              )
            : ListTile(
                title: const Text('logout'),
                onTap: () async {
                  final response = await request
                      .logout("https://jejakarbon.up.railway.app/auth/logout/");
                  if (!request.loggedIn) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Successfully logged out!"),
                    ));
                     // ignore: use_build_context_synchronously
                     Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("error occured!"),
                  ));
                }
              }),
      ],
    ),
  );
}
