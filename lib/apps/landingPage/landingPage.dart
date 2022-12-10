import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/auth/login.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Container(
              child: Image.asset(
                'assets/images/main_illustration.png',
                fit: BoxFit.contain,
                width: 300,
              ),
            ),
            SizedBox(height: 30,),
            const Text(
              "Track your Carbon Footprint and donate to nature for a better future!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),      
            SizedBox(height: 30,),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(300,40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.green
                ),
              ),
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text(
                "Login", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
            ),
            SizedBox(height: 10,),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(300,40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),)),
                backgroundColor: MaterialStateProperty.all(
                  Colors.green
                ),
              ),
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text(
                "Register", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: 
        FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FaqPage()),
                );
          },
          child: const Icon(Icons.forum),
        ),
    );
  }
}
