import 'package:jejakarbon_flutter/apps/auth/login.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_admin.dart';
import 'package:jejakarbon_flutter/apps/faq/page/faq_form.dart';
import 'package:jejakarbon_flutter/apps/faq/util/fetch_faq.dart';
import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Frequently Asked Questions"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 96, 183, 88),
                  Color.fromARGB(255, 153, 231, 150),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        ),
        drawer: buildDrawer(context),
        // future builder berisi data watchlist
        body: FutureBuilder(
          future: fetchWatchList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Pertanyaan belum ada? Tanyakan pada form berikut ini",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => GestureDetector(
                              child: Accordion(
                                maxOpenSections: 2,
                                headerBackgroundColor:
                                    Color.fromARGB(255, 198, 236, 209),
                                headerBorderRadius: 5,
                                scaleWhenAnimating: true,
                                openAndCloseAnimation: true,
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                sectionOpeningHapticFeedback:
                                    SectionHapticFeedback.heavy,
                                sectionClosingHapticFeedback:
                                    SectionHapticFeedback.light,
                                paddingListBottom: 1,
                                paddingListTop: 1,
                                rightIcon: 	Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 20),
                                children: [
                                  AccordionSection(
                                      isOpen: false,
                                      header: Text(
                                        "${snapshot.data![index].fields.question}",
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                      ),
                                      content: Column(children: [
                                        Container(
                                            alignment: Alignment.topLeft,
                                            padding: const EdgeInsets.all(10),
                                            child: Badge(
                                              badgeContent: Text(
                                                "asked by ${snapshot.data![index].fields.username}",
                                                overflow: TextOverflow.visible,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              shape: BadgeShape.square,
                                              badgeColor: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                "Jawaban:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "${snapshot.data![index].fields.answer}",
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            request.loggedIn && request.jsonData["is_admin"] ?
                                            Container(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all(Colors.white)),
                                                  onPressed: () {
                                                     Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => FaqFormAdmin(
                                                          faqs: snapshot.data![index]),
                                                    ));
                                                  },
                                                  child: const Text(
                                                    'edit answer',
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ) :
                                            Container()
                                          ],
                                        )
                                      ]))
                                ],
                              ),
                            )));
              }
            }
          },
        ),
        floatingActionButton: request.loggedIn && !request.jsonData["is_admin"]
            ? Container(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(100, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => FaqForm())));
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            : ( !request.loggedIn ?
              Container(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(100, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginPage())));
                    },
                    child: const Text(
                      'Login to add question!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ) :
              Container(
                // admin tidak bisa menambahkan pertanyaan
              )
        ));
  }
}
