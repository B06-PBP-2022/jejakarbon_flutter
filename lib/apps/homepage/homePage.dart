import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 1000,
              height: 570,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: new EdgeInsets.only(left: 45.0),
                      height: 150,
                      child: Image.asset(
                        'assets/images/logoWithTulisan.png',
                        fit: BoxFit.contain,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.green[300],
                      width: 1000,
                      // margin: new EdgeInsets.only(left: 20.0),
                      child: Text(
                        "    Hi!! ${request.jsonData["name"]}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.green[200],
                      width: 1000,
                      height: 35,
                      margin: const EdgeInsets.only(left: 70.0),
                      child: const Text(
                        "   ",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.green[100],
                      width: 1000,
                      height: 35,
                      margin: const EdgeInsets.only(left: 140.0),
                      child: const Text(
                        " ",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.only(left: 20, right: 10),
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              color: Colors.white,
                              Icons.account_circle,
                              size: 60,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              color: Colors.white,
                              Icons.format_list_bulleted,
                              size: 60,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              color: Colors.white,
                              Icons.calculate,
                              size: 60,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // const Text("for a better future!",
                //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                // SizedBox(height: 50),
                // const Text(
                //   "Fitur JejaKarbon",
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 30,
                //       color: Colors.green),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
