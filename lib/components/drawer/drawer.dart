import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer/listUnloginDrawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:jejakarbon_flutter/components/drawer/headerDrawer.dart';
import 'package:jejakarbon_flutter/components/drawer/listLoginDrawer.dart';

Drawer buildDrawer(BuildContext context) {
  final request = context.watch<CookieRequest>();
  return Drawer(
    child: SingleChildScrollView(
        child: Column(
      children: [
        MyHeaderDrawer(),
        !request.loggedIn ? MyListUnloginDrawer() : MyListLoginDrawer()
      ],
    )),
  );
}
