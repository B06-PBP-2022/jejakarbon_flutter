import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/profile/page/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProfileEditPage extends StatefulWidget {
  String title;
  ProfileEditPage({super.key, required this.title, this.reqAuthenticated});
  CookieRequest? reqAuthenticated;

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
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(87, 120, 219, 141),
                            blurRadius: 5,
                            offset: Offset(3, 3))
                      ]),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    // decoration: const BoxDecoration(
                    //     border: Border(
                    //         bottom: BorderSide(
                    //             color: Color.fromARGB(107, 158, 158, 158)))),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: label,
                        hintText: 'Masukkan $label',
                        border: InputBorder.none,
                      ),
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
                        // print("YES");

                        // Update username
                        // if (widget.reqAuthenticated != null) {
                        //   print("reqAuthenticated is not null");
                        // } else {
                        //   print("reqAuthenticated is null");
                        // }
                        var updateUsernameResponse = await request.post(
                          'https://jejakarbon.up.railway.app/profile/change-username-flutter/',
                          {
                            "username": username,
                          },
                        );

                        if (updateUsernameResponse['username'] == username) {
                          // Edit username success
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
                                            "Username berhasil diubah!",
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
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfilePage(),
                                            ),
                                          );
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
                      if (int.tryParse(_input) != null) {
                        var contactResponse = await request.post(
                            'https://jejakarbon.up.railway.app/profile/change-contact-flutter/',
                            {
                              "contact": _input,
                            });
                        // print(contactResponse);

                        if (contactResponse['contact'] == _input) {
                          // Edit username success
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
                                            "Kontak berhasil diubah!",
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
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfilePage(),
                                            ),
                                          );
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
                      } else {
                        // input is not a number
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
                                          "Input bukan angka!",
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

                      // if (contactResponse['contact'] == _input) {
                      //   print("YES");
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const ProfilePage()),
                      //   );
                      // } else {
                      //   print("NO");
                      // }

                      break;
                    case 'Ganti Email':
                      if (RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                          .hasMatch(_input)) {
                        // print("VALID");
                        var emailResponse = await request.post(
                            'https://jejakarbon.up.railway.app/profile/change-email-flutter/',
                            {
                              "email": _input,
                            });

                        if (emailResponse['email'] == _input) {
                          // Edit username success
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
                                            "Email berhasil diubah!",
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
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProfilePage(),
                                            ),
                                          );
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
                      } else {
                        // print("INVALID");
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
                                          "Email yang dimasukkan tidak valid!",
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
