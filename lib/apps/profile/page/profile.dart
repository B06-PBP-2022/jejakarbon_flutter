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
      body: const Center(
        child: Text('Profile'),
      ),
    );
  }
}
