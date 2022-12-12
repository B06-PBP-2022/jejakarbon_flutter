import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_page.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:jejakarbon_flutter/components/footer/footer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:footer/footer_view.dart';

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
          title: const Text('Add Question'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 96, 183, 88),
                  Color.fromARGB(255, 153, 231, 150),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        ),
        drawer: buildDrawer(context),
        body: 
        FooterView(
        footer: buildFooter(context),
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(1),
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(
                          color: Color.fromARGB(87, 120, 219, 141),
                          blurRadius: 5,
                          offset: Offset(3,3)
                        )]
                      ),
                      child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Tanyakan mengenai JejaKarbon",
                          labelText: "Pertanyaan",
                          border: InputBorder.none,
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
                    ),
                    ),
                    const SizedBox(height:30),
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
                          onTap: () async {
                              final response = await request.postJson(
                                  "https://jejakarbon.up.railway.app/faq/add-question/",
                                  jsonEncode({
                                    "question": question,
                                  }));

                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text(
                                    "Successfully asked! Thank you"),
                              ));
                              
                              Navigator.pop(context);
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const FaqPage()),
                              );
                            },
                          child: const Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                        ),
                      )
                    ),
                    const SizedBox(height: 10,),
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
                                MaterialPageRoute(builder: (context) => const FaqPage()),
                              );
                            },
                          child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      );
  }
}
