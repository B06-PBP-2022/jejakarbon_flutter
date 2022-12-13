import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/model/buka_donasi.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/open_donasi_page.dart';

import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:intl/intl.dart';

class EditDonasiForm extends StatefulWidget {
  DaftarDonasi target;

  EditDonasiForm({super.key, required this.target});

  @override
  State<EditDonasiForm> createState() =>
      _BukaDonasiFormState(targetEdit: target);
}

class _BukaDonasiFormState extends State<EditDonasiForm> {
  DaftarDonasi targetEdit;
  _BukaDonasiFormState({required this.targetEdit});

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  static const _locale = 'idr';

  var _judul = TextEditingController();
  var _deskripsi = TextEditingController();
  var _target = TextEditingController();

  // String judul = " ";
  // String deskripsi = " ";
  // String targetDonasi = " ";

  void initState() {
    super.initState();
    int j = targetEdit.fields.targetDonasi;
    _judul.text = targetEdit.fields.temaKegiatan;
    _deskripsi.text = targetEdit.fields.deskripsi;
    _target.text = "${j}";
  }

  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // judul = targetEdit.fields.temaKegiatan;
    // deskripsi = targetEdit.fields.deskripsi;
    // int j = targetEdit.fields.targetDonasi;
    // targetDonasi = "${j}";

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Donasi'),
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
                      controller: _judul,
                      decoration: InputDecoration(
                        hintText: "Judul . . . ",
                        labelText: "Judul Kegiatan",
                        icon: const Icon(Icons.text_fields),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // onChanged: (String? value) {
                      //   setState(() {
                      //     _judul.text = value!;
                      //   });
                      // },
                      onSaved: (String? value) {
                        setState(() {
                          _judul.text = value!;
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
                      controller: _deskripsi,
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
                      // onChanged: (String? value) {
                      //   setState(() {
                      //     _deskripsi.text = value!;
                      //   });
                      // },
                      onSaved: (String? value) {
                        setState(() {
                          _deskripsi.text = value!;
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
                      controller: _target,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[0-9]"),
                        )
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: _currency,
                        labelText: "Target Donasi",
                        icon: const Icon(Icons.monetization_on_rounded),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // onChanged: (String? value) {
                      //   setState(() {
                      //     _target.text = value!;
                      //   });
                      // },
                      onSaved: (String? value) {
                        setState(() {
                          _target.text = value!;
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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton.extended(
                  heroTag: 'uniqueTag',
                  label: Row(
                    children: [Icon(Icons.arrow_back)],
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BukaDonasiPage()),
                    );
                  },
                  // child: Icon(Icons.delete_sharp),
                ),
                FloatingActionButton.extended(
                    onPressed: () async {
                      // ignore: use_build_context_synchronously
                      final response = await request.postJson(
                          "https://jejakarbon.up.railway.app/form-pembuatan-donasi/edit-event/${widget.target.pk}/",
                          jsonEncode({
                            "tema_kegiatan": _judul.text,
                            "deskripsi": _deskripsi.text,
                            "target_donasi": _target.text,
                          }));
                      // print(response);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BukaDonasiPage()),
                      );
                    },
                    foregroundColor: Colors.white,
                    heroTag: 'uniqueTag',
                    label: Row(children: [Icon(Icons.save)])),
              ]),
        ));
  }
}
