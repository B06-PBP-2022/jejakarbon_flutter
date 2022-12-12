import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/profile/page/security_page.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:jejakarbon_flutter/components/drawer/drawer.dart';

import 'package:jejakarbon_flutter/apps/profile/page/profile_edit_page.dart';
import 'package:jejakarbon_flutter/apps/profile/page/donation_history_page.dart';
import 'package:jejakarbon_flutter/apps/profile/page/carbon_history_page.dart';
import 'package:jejakarbon_flutter/apps/profile/page/opened_donation_page.dart';

import 'package:jejakarbon_flutter/apps/profile/util/fetch_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
          future: fetchProfileData(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Profil tidak bisa ditampilkan :(",
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return Center(
                  child: Column(children: [
                    Container(
                      color: Colors.green,
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              SizedBox(height: 20),
                              Icon(
                                Icons.account_circle,
                                size: 170,
                                color: Colors.white,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Username :",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(snapshot.data.username,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              const SizedBox(height: 20),
                              const Text(
                                "Contact :",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(snapshot.data.contact,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              const SizedBox(height: 20),
                              const Text(
                                "Email :",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(snapshot.data.email,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 20),
                              ProfileButton(
                                text: 'Ganti Username',
                              ),
                              const SizedBox(height: 20),
                              ProfileButton(
                                text: 'Ganti Kontak',
                              ),
                              const SizedBox(height: 20),
                              ProfileButton(
                                text: 'Ganti Email',
                              ),
                              const SizedBox(height: 20),
                              if (!snapshot.data.organization) ...[
                                ProfileButton(
                                  text: 'Histori Karbon',
                                ),
                                const SizedBox(height: 20),
                                ProfileButton(
                                  text: 'Histori Donasi',
                                ),
                              ] else ...[
                                ProfileButton(
                                  text: 'Donasi yang Dibuka',
                                ),
                              ],
                              const SizedBox(height: 20),
                              // ProfileButton(
                              //   text: 'Keamanan',
                              // ),
                              // const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                );
              }
            }
          }),
    );
  }
}

class ProfileButton extends StatelessWidget {
  String text;
  ProfileButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(300, 50)),
          backgroundColor: MaterialStateProperty.all(Colors.green),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
      onPressed: () {
        switch (text) {
          case 'Ganti Username':
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileEditPage(title: text)),
            );
            break;
          case 'Ganti Kontak':
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileEditPage(title: text)),
            );
            break;
          case 'Ganti Email':
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileEditPage(title: text)),
            );
            break;
          case 'Histori Karbon':
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CarbonHistoryPage()),
            );
            break;
          case 'Histori Donasi':
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DonationHistoryPage()),
            );
            break;
          case 'Keamanan':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecurityPage()),
            );
            break;
          case 'Donasi yang Dibuka':
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OpenedDonationPage()),
            );
            break;
        }
      },
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
