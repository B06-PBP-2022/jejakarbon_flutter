import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jejakarbon_flutter/apps/kalkulator/model/kalkulatorqt.dart';
import 'package:jejakarbon_flutter/main.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// Mengambil data kalkulasi terakhir yang dilakukan user
Future<List<UserLastCalculation>> fetchLastCalculation(
    CookieRequest request) async {
  var response = await request
      .get('https://jejakarbon.up.railway.app/kalkulator/get_total_carbon/');

  print(response);

  List<UserLastCalculation> lastCalculation = [];
  lastCalculation.add(UserLastCalculation(
      result: response['carbon_print_total'],
      sum: response['hasil_kalkulasi']));
  return lastCalculation;
}

// Mengambil data json khusus Carbon Detail
Future<List<CarbonDetail>> fetchCarbonDetail(CookieRequest request) async {
  var responseCarbon = await request
      .get('https://jejakarbon.up.railway.app/kalkulator/kalkulator-json/');
  // print(response);

  // melakukan konversi data json menjadi object ToDo
  List<CarbonDetail> listOfCarbonDetail = [];
  for (var d in responseCarbon) {
    print(d.toString());
    if (d != null) {
      listOfCarbonDetail.add(CarbonDetail.fromJson(d));
    }
  }

  return listOfCarbonDetail;
}
