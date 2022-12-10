import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.only(top: 20.0),
      child: !request.loggedIn
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo_ico.ico'),
                    ),
                  ),
                ),
                const Text(
                  "JejaKarbon Profile",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "info@jejakarbon.dev",
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                children: const [
                  Text(
                    "Contributors: ",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Daffa Ilham Restupratama',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Dipa Alhaza',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Griselda Neysa Sadiya',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Pantun Elfreddy Sihombing',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Rania Maharani Narendra',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20,)
                ],
              )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo_ico.ico'),
                    ),
                  ),
                ),
                Text(
                  request.jsonData["name"],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  request.jsonData["email"],
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}