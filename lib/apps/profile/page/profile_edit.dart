import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/profile/page/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProfileEditPage extends StatefulWidget {
  String title;
  ProfileEditPage({super.key, required this.title});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String _input = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    String label = "";
    switch (widget.title) {
      case 'Ganti Username':
        label = "Username Baru";
        break;
      case 'Ganti Kontak':
        label = "Kontak Baru";
        break;
      case 'Ganti Email':
        label = "Email Baru";
        break;
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            // const Text("Username Baru : "),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: label,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  onChanged: (String? value) {
                    setState(() {
                      _input = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _input = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Kolom input tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    _input = _input;
                  });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProfilePage(
                  //       title: "Profile",
                  //     ),
                  //   ),
                  // );
                  switch (widget.title) {
                    case 'Ganti Username':

                      // Check username availability
                      String username = _input;
                      var usernameResponse = await request.get(
                        'https://jejakarbon.up.railway.app/profile/is-username-available/?username=$_input',
                        // {
                        //   "username": username,
                        // });
                      );

                      // print(usernameResponse['available']);

                      if (usernameResponse['available'] == true) {
                        print("YES");
                      } else {
                        BuildContext dialogContext;
                        showDialog(
                          context: context,
                          // barrierDismissible: false,
                          builder: (context) {
                            dialogContext = context;
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Center(
                                        child: Column(
                                      children: const [
                                        Text(
                                          "Username tidak tersedia!",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        // Navigator.pop(context);
                                        // setState(() {
                                        //   _judul = "";
                                        //   _nominal = "";
                                        //   _jenis = "Pemasukan";
                                        // });
                                        Navigator.pop(dialogContext);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }

                      break;
                    case 'Ganti Kontak':
                      var contactResponse = await request.post(
                          'https://jejakarbon.up.railway.app/profile/change-contact-flutter/',
                          {
                            "contact": _input,
                          });

                      print(contactResponse);
                      if (contactResponse['contact'] == _input) {
                        print("YES");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      } else {
                        print("NO");
                      }

                      break;
                    case 'Ganti Email':
                      break;
                  }
                }
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
