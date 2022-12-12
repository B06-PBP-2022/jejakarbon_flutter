import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/auth/login.dart';
import 'package:jejakarbon_flutter/apps/auth/register.dart';
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage( 
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill
            )
          ),
        child: Center(
          child: Column(
          children: <Widget>[
            const SizedBox(height: 200),
            Container(
              child: Image.asset(
                'assets/images/logoWithTulisan.png',
                fit: BoxFit.contain,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 55, 157, 46),
                    Color.fromARGB(255, 130, 232, 126),
                  ], 
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                boxShadow: [BoxShadow(
                  color: Colors.green.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0,3),
                )]
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  )
                )
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 55, 157, 46),
                    Color.fromARGB(255, 130, 232, 126),
                  ], 
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                boxShadow: [BoxShadow(
                  color: Colors.green.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0,3),
                )]
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  )
                )
            ),
          ],
        ),
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const FaqPage()),
          );
        },
        child: const Icon(Icons.forum),
      ),
    );
  }
}
