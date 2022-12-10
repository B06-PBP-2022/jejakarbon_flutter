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
          title: Text("Answer A Question"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 96, 183, 88),
                    Color.fromARGB(255, 163, 243, 160),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
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
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: Text("Pertanyaan", 
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
                      widget.faqs.fields.question, style: TextStyle(
                        color: Colors.grey
                        ),
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: Text("Jawaban Lama", 
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
                      widget.faqs.fields.answer, style: TextStyle(
                        color: Colors.grey
                        ),
                      ),
                    ),
                    Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: Text("Jawaban Baru", 
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
                  SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(100, 50)),
                            backgroundColor: MaterialStateProperty.all(Colors.green)),
                        onPressed: () async {
                          final response = await request.postJson(
                              "https://jejakarbon.up.railway.app/faq/edit-question/${widget.faqs.pk}/",
                              jsonEncode({
                                "answer": answer,
                              }));
                          Navigator.pop(context);
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const FaqPage()),
                          );
                        },
                        child: const Text(
                          'Submit Answer',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(100, 50)),
                            backgroundColor: MaterialStateProperty.all(Colors.green)),
                        onPressed: () {
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        );
  }
}
