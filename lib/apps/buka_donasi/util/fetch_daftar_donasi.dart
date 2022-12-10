import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jejakarbon_flutter/apps/buka_donasi/model/buka_donasi.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

Future<List<DaftarDonasi>> fetchDaftarDonasiList() async {
  var url = Uri.parse(
      'https://jejakarbon.up.railway.app/form-pembuatan-donasi/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  print(response.body);

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // print(data);

  // melakukan konversi data json menjadi object ToDo
  List<DaftarDonasi> listOfDonasi = [];
  for (var d in data) {
    if (d != null) {
      listOfDonasi.add(DaftarDonasi.fromJson(d));
    }
  }

  return listOfDonasi;
}

Future<List<DaftarDonasi>> fetchDaftarDonasiListUser(String username) async {
  var url = Uri.parse(
      'https://jejakarbon.up.railway.app/form-pembuatan-donasi/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // print(response.body);

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<DaftarDonasi> listOfDonasi = [];
  for (var d in data) {
    if (d != null && d["fields"]["username"] == username) {
      listOfDonasi.add(DaftarDonasi.fromJson(d));
    }
  }

  // print(listOfDonasi);

  return listOfDonasi;
}
