import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/profile/page/profile.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Edit Profile'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: const Center(
        child: Text('Edit Profile'),
      ),
    );
  }
}
