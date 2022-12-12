// To parse this JSON data, do
//
//     final carbonHistory = carbonHistoryFromJson(jsonString);

import 'dart:convert';

List<CarbonHistory> carbonHistoryFromJson(String str) => List<CarbonHistory>.from(json.decode(str).map((x) => CarbonHistory.fromJson(x)));

String carbonHistoryToJson(List<CarbonHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarbonHistory {
    CarbonHistory({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory CarbonHistory.fromJson(Map<String, dynamic> json) => CarbonHistory(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.historiKarbon,
        required this.dateInput,
        required this.usage,
        required this.carbonPrint,
        required this.komponenKalkulasi,
    });

    int historiKarbon;
    DateTime dateInput;
    String usage;
    double carbonPrint;
    int komponenKalkulasi;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        historiKarbon: json["histori_karbon"],
        dateInput: DateTime.parse(json["date_input"]),
        usage: json["usage"],
        carbonPrint: json["carbon_print"].toDouble(),
        komponenKalkulasi: json["komponen_kalkulasi"],
    );

    Map<String, dynamic> toJson() => {
        "histori_karbon": historiKarbon,
        "date_input": "${dateInput.year.toString().padLeft(4, '0')}-${dateInput.month.toString().padLeft(2, '0')}-${dateInput.day.toString().padLeft(2, '0')}",
        "usage": usage,
        "carbon_print": carbonPrint,
        "komponen_kalkulasi": komponenKalkulasi,
    };
}
