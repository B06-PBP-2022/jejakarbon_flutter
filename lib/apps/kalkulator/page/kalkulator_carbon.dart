import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<KalkulatorPage> {
  final _formKey = GlobalKey<FormState>();
  String _usage = "listrik";
  Float _kilowattHour = 0 as Float;
  Float _jarakKm = 0 as Float;
  Float _litrePerKm = 0 as Float;
  String _fuelType = "bensin";
  Float _carbonPrint = 0 as Float;
  DateTime __tanggal = DateTime.now();
  List<String> __jenisUsage = ["listrik", "mobil", "motor"];
  List<String> __fuelTypes = ["bensin", "diesel"];

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }



Widget listrikForm(BuildContext context){
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
          _kilowattHour = value! as Float;
        });
      },
      // Menambahkan behavior saat data disimpan
      onSaved: (String? value) {
        setState(() {
          _kilowattHour = value! as Float;
        });
      },
      // Validator sebagai validasi form
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi bagian penggunaan litrik!';
        } else if (!(isNumeric(value))) {
          return 'Penggunaan listrik hanya bisa diisi dengan format angka';
        }
        return null;
      },
    ),
  );
}

List<Widget> kendaraanForm(BuildContext context){
  return [Padding(
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
          _jarakKm = value! as Float;
        });
      },
      // Menambahkan behavior saat data disimpan
      onSaved: (String? value) {
        setState(() {
          _jarakKm = value! as Float; 
        });
      },
      // Validator sebagai validasi form
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi bagian jarak tempuh!';
        } else if (!(isNumeric(value))) {
          return 'Jarak tempuh hanya bisa diisi dengan format angka';
        }
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
          _litrePerKm = value! as Float;
        });
      },
      // Menambahkan behavior saat data disimpan
      onSaved: (String? value) {
        setState(() {
          _litrePerKm = value! as Float;
        });
      },
      // Validator sebagai validasi form
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi bagian konsumsi BBM!';
        } else if (!(isNumeric(value))) {
          return 'Konsumsi BBM hanya bisa diisi dengan format angka';
        }
        return null;
      },
    ),
  )];
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Kalkulator Carbon'),
    ),
    // Menambahkan drawer menu
    drawer: buildDrawer(context),
    body: Form(
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
                      value: _usage,
                      hint: const Text("Pilih Jenis"),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: __jenisUsage.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items[0].toUpperCase()+items.substring(1)),
                        );
                      }).toList(),
                      onChanged:(String? newValue) {
                        setState(() {
                          _usage = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                _usage == "listrik"
                  ? listrikForm(context)
                  : listrikForm(context),
                // TextButton(
                //   style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(Colors.blue),
                //   ),
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       Budget.listBudget.add(Budget(
                //           judul: _judul,
                //           nominal: _nominal,
                //           pilihan_jenis: _pilihanjenis));
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const DataFormPage()),
                //       );
                //     }
                //   },
                //   child: const Text(
                //     "Simpan",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
