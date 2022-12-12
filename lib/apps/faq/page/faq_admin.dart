// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/faq/model/faq.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_page.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FaqFormAdmin extends StatefulWidget {
  final Faq faqs;
  const FaqFormAdmin({super.key, required this.faqs});

  @override
  State<FaqFormAdmin> createState() => _FaqFormAdminState();
}

class _FaqFormAdminState extends State<FaqFormAdmin> {
  final _formKey = GlobalKey<FormState>();
  String answer = '';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final Faq faqs;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Answer A Question"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 96, 183, 88),
                    Color.fromARGB(255, 163, 243, 160),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
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
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: const Text("Pertanyaan", 
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),                      
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.faqs.fields.question, style: const TextStyle(
                        color: Colors.grey
                        ),
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: const Text("Jawaban Lama", 
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),                      
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.faqs.fields.answer, style: const TextStyle(
                        color: Colors.grey
                        ),
                      ),
                    ),
                    Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: const Text("Jawaban Baru", 
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Jawaban baru..",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          answer = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          answer = value!;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Jawab dengan benar!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),
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
                              "https://jejakarbon.up.railway.app/faq/edit-question/${widget.faqs.pk}/",
                              jsonEncode({
                                "answer": answer,
                              }));

                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text(
                                    "Successfully answered! Thank you"),
                              ));

                              Navigator.pop(context);
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const FaqPage()),
                              );
                            },
                          child: const Text(
                              'Save',
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
                  const SizedBox(height: 10,),
                   Container(
                    height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 167, 22, 22),
                            Color.fromARGB(255, 240, 81, 70),
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
                              "https://jejakarbon.up.railway.app/faq/delete-question/${widget.faqs.pk}/",
                              jsonEncode({
                              }));

                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                      "Successfully deketed! Thank you"),
                                ));

                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const FaqPage()),
                              );
                            },
                          child: const Text(
                              'Delete',
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
        ),
        );
  }
}
