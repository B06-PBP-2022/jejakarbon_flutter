import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:jejakarbon_flutter/apps/kalkulator/util/fetch.dart';

enum FuelType { bensin, diesel }

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<KalkulatorPage> {
  final _formKey = GlobalKey<FormState>();
  String usage = "listrik";
  String kilowattHour = "0";
  double jarakKm = 0;
  double litrePerKm = 0;
  String fuelType = "bensin";
  FuelType? fueltype = FuelType.bensin;
  double _carbonPrint = 0;
  DateTime __tanggal = DateTime.now();
  List<String> __jenisUsage = ["listrik", "mobil", "motor"];
  List<String> __fuelTypes = ["bensin", "diesel"];

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  Widget listrikForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Contoh: 85.5",
          labelText: "Penggunaan Listrik (kWh)",
          // Menambahkan circular border agar lebih rapi
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        // Menambahkan behavior saat nama diketik
        onChanged: (String? value) {
          setState(() {
            kilowattHour = value!;
          });
        },
        // Menambahkan behavior saat data disimpan
        onSaved: (String? value) {
          setState(() {
            kilowattHour = value!;
          });
        },
        // Validator sebagai validasi form
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Mohon isi bagian penggunaan litrik!';
          } else if (!(isNumeric(value))) {
            return 'Penggunaan listrik hanya bisa diisi dengan format angka';
          }
          kilowattHour = value;
          return null;
        },
      ),
    );
  }

  List<Widget> kendaraanForm(BuildContext context) {
    return [
      Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.local_gas_station_sharp),
            title: Text("Jenis BBM"),
          ),
          ListTile(
            title: const Text('Bensin'),
            leading: Radio<FuelType>(
              value: FuelType.bensin,
              groupValue: fueltype,
              onChanged: (FuelType? value) {
                setState(() {
                  fueltype = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Solar'),
            leading: Radio<FuelType>(
              value: FuelType.diesel,
              groupValue: fueltype,
              onChanged: (FuelType? value) {
                setState(() {
                  fueltype = value;
                });
              },
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Contoh: 20.4",
            labelText: "Jarak Tempuh (km)",
            // Menambahkan circular border agar lebih rapi
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          // Menambahkan behavior saat nama diketik
          onChanged: (String? value) {
            setState(() {
              jarakKm = value! as double;
            });
          },
          // Menambahkan behavior saat data disimpan
          onSaved: (String? value) {
            setState(() {
              jarakKm = value! as double;
            });
          },
          // Validator sebagai validasi form
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Mohon isi bagian jarak tempuh!';
            } else if (!(isNumeric(value))) {
              return 'Jarak tempuh hanya bisa diisi dengan format angka';
            }
            jarakKm = double.parse(value);
            return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Contoh: 10",
            labelText: "Konsumsi BBM (km/l)",
            // Menambahkan circular border agar lebih rapi
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          // Menambahkan behavior saat nama diketik
          onChanged: (String? value) {
            setState(() {
              litrePerKm = value! as double;
            });
          },
          // Menambahkan behavior saat data disimpan
          onSaved: (String? value) {
            setState(() {
              litrePerKm = value! as double;
            });
          },
          // Validator sebagai validasi form
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Mohon isi bagian konsumsi BBM!';
            } else if (!(isNumeric(value))) {
              return 'Konsumsi BBM hanya bisa diisi dengan format angka';
            }
            litrePerKm = double.parse(value);
            return null;
          },
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Kalkulator Carbon'),
        ),
        // Menambahkan drawer menu
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: fetchLastCalculation(request),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Text('Belum ada yang kamu tonton');
                } else {
                  return Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: DropdownButton(
                                  value: usage,
                                  hint: const Text("Pilih Jenis"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: __jenisUsage.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items[0].toUpperCase() +
                                          items.substring(1)),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      usage = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            if (usage == "listrik") ...[
                              listrikForm(context)
                            ] else ...[
                              for (var widget in kendaraanForm(context)) widget
                            ],
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (usage == "listrik") {
                                    print(usage);
                                    print(kilowattHour);
                                    String postUrl1 =
                                        'https://jejakarbon.up.railway.app/kalkulator/calculate-listrik-flutter/';
                                    var url = Uri.parse(postUrl1);
                                    final response = await http.post(url,
                                        body: json.encode({
                                          'kilowatt_hour': kilowattHour,
                                          'usage': usage,
                                        }));
                                  } else {
                                    String postUrl2 =
                                        'https://jejakarbon.up.railway.app/kalkulator/calculate-kendaraan-flutter/';
                                    var url = Uri.parse(postUrl2);
                                    final response = await http.post(url,
                                        body: json.encode({
                                          "fuel_type": fueltype.toString(),
                                          "kilometer_jarak": jarakKm,
                                          "litre_per_km": litrePerKm,
                                          "usage": usage,
                                        }));
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              KalkulatorPage()));
                                }
                              },
                              child: const Text(
                                "Hitung",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    // width: 900,
                                    // height: 100,
                                    height: 120.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    // padding: const EdgeInsets.all(18),
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        // color: Colors.green,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                                'Kalkulasi Carbon Print Terakhir',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            Text(
                                              '${snapshot.data[0].sum}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ))),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    // width: 900,
                                    // height: 100,
                                    // width: 150,
                                    // height: 150,
                                    height: 120.0,
                                    width: 200.0,
                                    // margin: const EdgeInsets.symmetric(
                                    //     horizontal: 60, vertical: 10),
                                    // padding: const EdgeInsets.all(18),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Total Carbon Print Kamu',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '${snapshot.data[0].result}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )))
                              ],
                            )

                            // )
                            // Center(
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Card(
                            //       child: Text('${snapshot.data[0].result}'),
                            //     ),
                            //   ),
                            // ),
                            // Center(
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Card(
                            //       child: Text('${snapshot.data[0].sum}'),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
