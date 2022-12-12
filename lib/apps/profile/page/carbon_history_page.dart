import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:jejakarbon_flutter/apps/profile/page/profile_page.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:jejakarbon_flutter/apps/profile/util/fetch_profile.dart';

class CarbonHistoryPage extends StatefulWidget {
  const CarbonHistoryPage({super.key});

  @override
  State<CarbonHistoryPage> createState() => _CarbonHistoryPageState();
}

class _CarbonHistoryPageState extends State<CarbonHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
          title: const Text("Histori Karbon"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: FutureBuilder(
          future: fetchCarbonHistory(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum ada histori karbon :D",
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                double totalCarbon = 0;
                for (var i = 0; i < snapshot.data!.length; i++) {
                  totalCarbon += snapshot.data![i].fields.carbonPrint;
                }
                return Column(
                  children: [
                    const SizedBox(height: 30),
                    Text("Total Karbon: ${totalCarbon.toStringAsFixed(2)} kg",
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 10),
                    Flexible(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (_, index) => Card(
                                margin: const EdgeInsets.all(10),
                                color: Colors.green,
                                elevation: 10,
                                shadowColor: Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/logo_ico.ico'),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.usage}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Berat karbon: ${snapshot.data![index].fields.carbonPrint.toStringAsFixed(2)} kilogram",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Tanggal input: ${snapshot.data![index].fields.dateInput.toString().substring(0, 10)}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ]),
                              )),
                    ),
                  ],
                );
              }
            }
          }),
    );
  }
}
