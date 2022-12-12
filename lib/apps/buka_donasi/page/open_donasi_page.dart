import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/model/buka_donasi.dart';
import 'package:jejakarbon_flutter/apps/pembayaran/payment.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/util/fetch_daftar_donasi.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/form_buka_donasi.dart';
import 'package:jejakarbon_flutter/apps/auth/login.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/detail.dart';

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
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Buka Donasi"),
        ),
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: request.jsonData["organization"]
                ? fetchDaftarDonasiListUser(request.jsonData["username"])
                : fetchDaftarDonasiList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null || snapshot.data!.length == 0) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData || snapshot.data!.length == 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Tidak ada daftar event donasi yang dibuat",
                        style: TextStyle(color: Colors.black26, fontSize: 21),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(15.0),
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(255, 198, 236, 209),
                                border: Border.all(color: Colors.green)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "${snapshot.data![index].fields.temaKegiatan}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${snapshot.data![index].fields.tanggalPembuatan}",
                                  style: const TextStyle(
                                    color: Colors.black26,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "${snapshot.data![index].fields.deskripsi}",
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Total dana yang terkumpul: \nRp.${snapshot.data![index].fields.totalDonasiTerkumpul} / Rp.${snapshot.data![index].fields.targetDonasi}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                request.jsonData["organization"]
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.green),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                overlayColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .hovered)) {
                                                      return Colors
                                                          .green.shade100
                                                          .withOpacity(0.04);
                                                    }
                                                    if (states.contains(
                                                            MaterialState
                                                                .focused) ||
                                                        states.contains(
                                                            MaterialState
                                                                .pressed)) {
                                                      return Colors
                                                          .green.shade100
                                                          .withOpacity(0.12);
                                                    }
                                                    return null; // Defer to the widget's default.
                                                  },
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DonasiDetailPage(
                                                              detailEvent:
                                                                  snapshot.data![
                                                                      index])),
                                                );
                                              },
                                              child: const Text('Detail')),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.green),
                                                overlayColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .hovered)) {
                                                      return Colors
                                                          .green.shade600
                                                          .withOpacity(0.04);
                                                    }
                                                    if (states.contains(
                                                            MaterialState
                                                                .focused) ||
                                                        states.contains(
                                                            MaterialState
                                                                .pressed)) {
                                                      return Colors
                                                          .green.shade600
                                                          .withOpacity(0.12);
                                                    }
                                                    return null; // Defer to the widget's default.
                                                  },
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => PaymentMethod(detailEvent: snapshot.data![index])),
                                                 
                                                );
                                              },
                                              child: const Text('Donasi')),
                                          const SizedBox(width: 20),
                                          TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.green),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                overlayColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color?>(
                                                  (Set<MaterialState> states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .hovered)) {
                                                      return Colors
                                                          .green.shade100
                                                          .withOpacity(0.04);
                                                    }
                                                    if (states.contains(
                                                            MaterialState
                                                                .focused) ||
                                                        states.contains(
                                                            MaterialState
                                                                .pressed)) {
                                                      return Colors
                                                          .green.shade100
                                                          .withOpacity(0.12);
                                                    }
                                                    return null; // Defer to the widget's default.
                                                  },
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DonasiDetailPage(
                                                              detailEvent:
                                                                  snapshot.data![
                                                                      index])),
                                                );
                                              },
                                              child: const Text('Detail')),
                                        ],
                                      ),
                              ],
                            ),
                          ));
                }
              }
            }),
        floatingActionButton: request.loggedIn
            ? Container(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: request.jsonData["organization"]
                      ? TextButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(100, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => BukaDonasiForm())));
                          },
                          child: const Text(
                            'Open donasi',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )
                      : TextButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(30, 30)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            showAlertDialog(context);
                          },
                          child: const Text(
                            'Organization feature',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                ),
              )
            : Container(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(100, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginPage())));
                    },
                    child: const Text(
                      'Login for access',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ));
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Organization feature"),
      content:
          Text("Hanya akun bertipe organisasi yang dapat membuka forum donasi"),
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
