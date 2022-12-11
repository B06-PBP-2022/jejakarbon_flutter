import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: buildDrawer(context),
      body: Center(
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
                      size: 200,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 20),
                    Text(
                      "Username :",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Contact :",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email :",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    ProfileButton(
                      text: 'Change Username',
                    ),
                    const SizedBox(height: 20),
                    ProfileButton(
                      text: 'Change Contact',
                    ),
                    const SizedBox(height: 20),
                    ProfileButton(
                      text: 'Change Email',
                    ),
                    const SizedBox(height: 20),
                    ProfileButton(
                      text: 'Carbon History',
                    ),
                    const SizedBox(height: 20),
                    ProfileButton(
                      text: 'Donation History',
                    ),
                    const SizedBox(height: 20),
                    ProfileButton(
                      text: 'Security',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
