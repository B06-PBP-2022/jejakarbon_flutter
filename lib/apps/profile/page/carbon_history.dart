import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:jejakarbon_flutter/apps/profile/page/profile_page.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:jejakarbon_flutter/apps/profile/util/fetch_profile.dart';

class CarbonHistoryPage extends StatefulWidget {
  const CarbonHistoryPage({super.key});

  @override
  State<CarbonHistoryPage> createState() => _CarbonHistoryPageState();
}

class _CarbonHistoryPageState extends State<CarbonHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
          title: const Text("Histori Karbon"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
        child: Column(children: const [Text("Histori Karbon")]),
      ),
    );
  }
}
