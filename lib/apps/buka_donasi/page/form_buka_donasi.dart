import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:intl/intl.dart';

class BukaDonasiForm extends StatefulWidget {
  const BukaDonasiForm({super.key});

  @override
  State<BukaDonasiForm> createState() => _BukaDonasiFormState();
}

class _BukaDonasiFormState extends State<BukaDonasiForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  static const _locale = 'idr';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  String judul = " ";
  String deskripsi = " ";
  String targetDonasi = " ";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Buka Donasi'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 96, 183, 88),
                    Color.fromARGB(255, 152, 249, 149),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Judul . . . ",
                        labelText: "Judul Kegiatan",
                        icon: const Icon(Icons.text_fields),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          judul = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          judul = value!;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tuliskan judul dengan jelas';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      minLines: 6,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: " Deskripsi . . .",
                        labelText: "Deskripsi",
                        icon: const Icon(Icons.format_quote),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          deskripsi = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          deskripsi = value!;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Mohon isi dengan lengkap terkait informasi kegiatan';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[0-9]"),
                        )
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: _currency,
                        labelText: "Target Donasi",
                        icon: const Icon(Icons.assignment),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          targetDonasi = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          targetDonasi = value!;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Hanya menerima angka';
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
                final response = await request.postJson(
                    "https://jejakarbon.up.railway.app/form-pembuatan-donasi/open-donasi-flutter/",
                    jsonEncode({
                      "tema_kegiatan": judul,
                      "deskripsi": deskripsi,
                      "target_donasi": targetDonasi,
                    }));

                Navigator.pop(context);
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BukaDonasiForm()),
                );
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ));
  }
}
