import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FormOpenDonasi extends StatefulWidget {
  const FormOpenDonasi({Key? key}) : super(key: key);
  @override
  FormOpenDonasiState createState() => FormOpenDonasiState();
}

class FormOpenDonasiState extends State<FormOpenDonasi> {
  final _formKey = GlobalKey<FormState>();

  String judul = " ";

  String deskripsi = " ";
  String targetDonasi = " ";

  submit(BuildContext context) async {
    final request = Provider.of<CookieRequest>(context, listen: false);

    final response = await request.postJson(
        'https://jejakarbon.up.railway.app/form-pembuatan-donasi/open-donasi-flutter',
        jsonEncode({
          'judul': judul,
          'deskripsi': deskripsi,
          'target': targetDonasi,
        }));
  }

  Widget _buildJudul() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Judul Kegiatan",
          icon: const Icon(Icons.text_fields),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Judul Kegiatan wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDeskripsi() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        minLines:
            6, // any number you need (It works as the rows for the textarea)
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          labelText: "Deskripsi",
          icon: const Icon(Icons.format_quote),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Deskripsi artikel wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTargetDonasi() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Isi",
          icon: const Icon(Icons.assignment),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Target Donasi wajib diisi';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Buka Donasi")),
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildJudul(),
                  _buildDeskripsi(),
                  _buildTargetDonasi(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    //color: Colors.blue,
                    onPressed: () {
                      Provider.of<CookieRequest>(context, listen: false);
                      if (_formKey.currentState?.validate() ?? true) {
                        showConfirmDialog(context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }

  showConfirmDialog(BuildContext context) {
    Provider.of<CookieRequest>(context, listen: false);

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Tidak"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget continueButton = TextButton(
      child: const Text("Iya"),
      onPressed: () {
        submit(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FormOpenDonasi()));
        showAlertDialog(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Konfirmasi"),
      content: const Text("Open Donasi?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    Provider.of<CookieRequest>(context, listen: false);
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Selamat!"),
      content: const Text("Kegiatan Donasi berhasil dibuat"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
