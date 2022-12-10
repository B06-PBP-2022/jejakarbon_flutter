import 'package:flutter/material.dart';
import 'package:jejakarbon_flutter/components/drawer/drawer.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/model/buka_donasi.dart';
import 'package:jejakarbon_flutter/apps/buka_donasi/page/open_donasi_page.dart';

class DonasiDetailPage extends StatefulWidget {
  const DonasiDetailPage({super.key, required this.detailEvent});

  final DaftarDonasi detailEvent;

  @override
  State<DonasiDetailPage> createState() => _MyWatchDetailState();
}

// ignore: camel_case_types
class _MyWatchDetailState extends State<DonasiDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Kegiatan"),
      ),
      drawer: buildDrawer(context),
      body: Container(
          padding: const EdgeInsets.all(5),
          height: 800,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.detailEvent.fields.temaKegiatan,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    '${widget.detailEvent.fields.pencetusDonasi}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'dibuat pada : ${widget.detailEvent.fields.tanggalPembuatan.day}-${widget.detailEvent.fields.tanggalPembuatan.month}-${widget.detailEvent.fields.tanggalPembuatan.year}, ${widget.detailEvent.fields.tanggalPembuatan.hour}:${widget.detailEvent.fields.tanggalPembuatan.minute}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    widget.detailEvent.fields.deskripsi,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Dana terkumpul : Rp.${widget.detailEvent.fields.totalDonasiTerkumpul} \nDari target           : Rp.${widget.detailEvent.fields.targetDonasi}  ",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 35,
        margin: const EdgeInsets.all(3),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BukaDonasiPage()),
            );
          },
          child: const Center(
            child: Text('Back'),
          ),
        ),
      ),
    );
  }
}
