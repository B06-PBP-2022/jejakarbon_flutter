import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jejakarbon_flutter/apps/kalkulator/model/kalkulator.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

 Future<List<CarbonDetail>> fetchWatchList() async {
        var url = Uri.parse('https://jejakarbon.up.railway.app/kalkulator/kalkulator-json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object ToDo
        List<CarbonDetail> listOfFaq = [];
        for (var d in data) {
        if (d != null) {
            listOfFaq.add(CarbonDetail.fromJson(d));
        }
        }

        return listOfFaq;
    }