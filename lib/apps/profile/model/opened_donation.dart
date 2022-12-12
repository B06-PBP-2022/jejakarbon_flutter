// To parse this JSON data, do
//
//     final openedDonation = openedDonationFromJson(jsonString);

import 'dart:convert';

List<OpenedDonation> openedDonationFromJson(String str) => List<OpenedDonation>.from(json.decode(str).map((x) => OpenedDonation.fromJson(x)));

String openedDonationToJson(List<OpenedDonation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OpenedDonation {
    OpenedDonation({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory OpenedDonation.fromJson(Map<String, dynamic> json) => OpenedDonation(
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
        required this.temaKegiatan,
        required this.pencetusDonasi,
        required this.tanggalPembuatan,
        required this.deskripsi,
        required this.totalDonasiTerkumpul,
        required this.targetDonasi,
        required this.username,
    });

    int user;
    String temaKegiatan;
    String pencetusDonasi;
    DateTime tanggalPembuatan;
    String deskripsi;
    int totalDonasiTerkumpul;
    int targetDonasi;
    String username;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        temaKegiatan: json["tema_kegiatan"],
        pencetusDonasi: json["pencetus_donasi"],
        tanggalPembuatan: DateTime.parse(json["tanggal_pembuatan"]),
        deskripsi: json["deskripsi"],
        totalDonasiTerkumpul: json["total_donasi_terkumpul"],
        targetDonasi: json["target_donasi"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "tema_kegiatan": temaKegiatan,
        "pencetus_donasi": pencetusDonasi,
        "tanggal_pembuatan": tanggalPembuatan.toIso8601String(),
        "deskripsi": deskripsi,
        "total_donasi_terkumpul": totalDonasiTerkumpul,
        "target_donasi": targetDonasi,
        "username": username,
    };
}
