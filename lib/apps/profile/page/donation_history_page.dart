import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:jejakarbon_flutter/apps/profile/util/fetch_profile.dart';

class DonationHistoryPage extends StatefulWidget {
  const DonationHistoryPage({super.key});

  @override
  State<DonationHistoryPage> createState() => _DonationHistoryPageState();
}

class _DonationHistoryPageState extends State<DonationHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
          title: const Text("Histori Donasi"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: FutureBuilder(
          future: fetchDonationHistory(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Belum ada histori donasi :(",
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                var totalNominal = 0;
                for (var i = 0; i < snapshot.data!.length; i++) {
                  totalNominal += snapshot.data![i].fields.nominal as int;
                }
                return Column(
                  children: [
                    const SizedBox(height: 30),
                    Text("Total Donasi: Rp$totalNominal",
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
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rp${snapshot.data![index].fields.nominal}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Pesan:",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "${snapshot.data![index].fields.pesan}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
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
