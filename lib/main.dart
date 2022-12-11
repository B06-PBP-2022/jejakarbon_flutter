import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/landingPage/landingPage.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Jejakarbon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const LandingPage(),
        routes: {
          "/landing-page": (BuildContext context) => const LandingPage(),
        },
      ),
    );
  }
}
