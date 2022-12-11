import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/landingPage/landingPage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:jejakarbon_flutter/apps/profile/page/profile_page.dart';
import 'package:jejakarbon_flutter/apps/homepage/homePage.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_page.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/open_donasi_page.dart';

class MyListLoginDrawer extends StatefulWidget {
  @override
  _MyListLoginDrawerState createState() => _MyListLoginDrawerState();
}

class _MyListLoginDrawerState extends State<MyListLoginDrawer> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Beranda'),
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
          leading: const Icon(Icons.account_circle),
          title: const Text('Profil'),
          onTap: () {
            // Route ke main
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
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
          leading: const Icon(Icons.format_list_bulleted),
          title: const Text('Daftar Donasi'),
          onTap: () {
            // Route ke main
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BukaDonasiPage()),
            );
          },
        ),
        ListTile(
            leading: const Icon(Icons.logout),
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
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("error occured!"),
                ));
              }
            }),
      ],
    );
  }
}
