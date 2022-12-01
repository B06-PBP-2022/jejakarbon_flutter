import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jejakarbon_flutter/apps/faq/model/faq.dart';

 Future<List<Faq>> fetchWatchList() async {
        var url = Uri.parse('https://jejakarbon.up.railway.app/faq/json/');
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
        List<Faq> listOfFaq = [];
        for (var d in data) {
        if (d != null) {
            listOfFaq.add(Faq.fromJson(d));
        }
        }

        return listOfFaq;
    }