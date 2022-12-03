import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/util/fetch_daftar_donasi.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(const BukaDonasiPage());
}

class BukaDonasiPage extends StatefulWidget {
  const BukaDonasiPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BukaDonasiState();
}

class _BukaDonasiState extends State<BukaDonasiPage> {
  // TODO: implement build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Buka Donasi"),
        ),
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: fetchDaftarDonasiList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada Event Donasi yang dibuka :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(3.0),
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(255, 145, 209, 147),
                                border:
                                    Border.all(color: Colors.green.shade200)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "${snapshot.data![index].fields.temaKegiatan}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "${snapshot.data![index].fields.deskripsi}",
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Total dana yang terkumpul: \n ${snapshot.data![index].fields.totalDonasiTerkumpul} / ${snapshot.data![index].fields.targetDonasi}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.green.shade100),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.green.shade800),
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color?>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.hovered)) {
                                                return Colors.green.shade700
                                                    .withOpacity(0.04);
                                              }
                                              if (states.contains(
                                                      MaterialState.focused) ||
                                                  states.contains(
                                                      MaterialState.pressed)) {
                                                return Colors.green.shade700
                                                    .withOpacity(0.12);
                                              }
                                              return null; // Defer to the widget's default.
                                            },
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text('Donasi')),
                                  ],
                                ),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}
