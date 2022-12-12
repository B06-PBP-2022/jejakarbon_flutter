// To parse this JSON data, do
//
//     final donationHistory = donationHistoryFromJson(jsonString);

import 'dart:convert';

List<DonationHistory> donationHistoryFromJson(String str) => List<DonationHistory>.from(json.decode(str).map((x) => DonationHistory.fromJson(x)));

String donationHistoryToJson(List<DonationHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DonationHistory {
    DonationHistory({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory DonationHistory.fromJson(Map<String, dynamic> json) => DonationHistory(
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
        required this.user,
        required this.nominal,
        required this.pesan,
    });

    int user;
    int nominal;
    String pesan;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        nominal: json["nominal"],
        pesan: json["pesan"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "nominal": nominal,
        "pesan": pesan,
    };
}
