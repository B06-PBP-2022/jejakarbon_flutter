import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_page.dart';
import 'package:jejakarbon_flutter/components/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FaqForm extends StatefulWidget {
  const FaqForm({super.key});

  @override
  State<FaqForm> createState() => _FaqFormState();
}

class _FaqFormState extends State<FaqForm> {
  final _formKey = GlobalKey<FormState>();
  String question = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Question'),
      ),
      drawer: buildDrawer(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Tanyakan mengenai JejaKarbon",
                      labelText: "Pertanyaan",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        question = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        question = value!;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                              return 'Tanyakan dengan benar!';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
          padding: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(100, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () async {
                final response = await request.post('https://jejakarbon.up.railway.app/faq/add-question/', {
                  'id' : request.getJsonData()['id'],
                  'username' : request.getJsonData()['username'],
                  'question' : question,
                  'answer' : "",
                });
                Navigator.pop(context);
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FaqPage()),
                  );
              },
              child: const Text(
                'Submit Question',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
          ),
        )
    );
  }
}
