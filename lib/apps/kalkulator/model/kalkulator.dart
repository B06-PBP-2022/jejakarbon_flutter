// // To parse this JSON data, do
// //
// //     final carbonDetail = carbonDetailFromJson(jsonString);

// import 'dart:convert';
// import 'dart:ffi';

// List<CarbonDetail> carbonDetailFromJson(String str) => List<CarbonDetail>.from(
//     json.decode(str).map((x) => CarbonDetail.fromJson(x)));

// String carbonDetailToJson(List<CarbonDetail> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CarbonDetail {
//   CarbonDetail({
//     required this.model,
//     required this.pk,
//     required this.fields,
//   });

//   String model;
//   int pk;
//   Fields fields;

//   factory CarbonDetail.fromJson(Map<String, dynamic> json) => CarbonDetail(
//         model: json["model"],
//         pk: json["pk"],
//         fields: Fields.fromJson(json["fields"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "model": model,
//         "pk": pk,
//         "fields": fields.toJson(),
//       };
// }

// class Fields {
//   Fields({
//     required this.historiKarbon,
//     required this.dateInput,
//     required this.usage,
//     required this.carbonPrint,
//     required this.komponenKalkulasi,
//   });

//   int historiKarbon;
//   DateTime dateInput;
//   String usage;
//   double carbonPrint;
//   int komponenKalkulasi;

//   factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//         historiKarbon: json["histori_karbon"],
//         dateInput: DateTime.parse(json["date_input"]),
//         usage: json["usage"],
//         carbonPrint: json["carbon_print"].toDouble(),
//         komponenKalkulasi: json["komponen_kalkulasi"],
//       );

//   Map<String, dynamic> toJson() => {
//         "histori_karbon": historiKarbon,
//         "date_input":
//             "${dateInput.year.toString().padLeft(4, '0')}-${dateInput.month.toString().padLeft(2, '0')}-${dateInput.day.toString().padLeft(2, '0')}",
//         "usage": usage,
//         "carbon_print": carbonPrint,
//         "komponen_kalkulasi": komponenKalkulasi,
//       };
// }

// class CarbonPrintHistori {
//   CarbonPrintHistori({
//     required this.user,
//     required this.carbonPrintTotal,
//   });

//   String user;
//   Float carbonPrintTotal;

//   factory CarbonPrintHistori.fromJson(Map<String, dynamic> json) => CarbonPrintHistori(
//         user: json["hist"],
//         dateInput: DateTime.parse(json["date_input"]),
//         usage: json["usage"],
//         carbonPrint: json["carbon_print"].toDouble(),
//         komponenKalkulasi: json["komponen_kalkulasi"],
//       );
// }

// class KomponenKalkulator {
//   KomponenKalkulator({
//     required this.kilowattHour,
//     required this.fuelType,
//     required this.kilometerJarak,
//     required this.litrePerKm,
//   });

//   Float kilowattHour;
//   String fuelType;
//   Float kilometerJarak;
//   Float litrePerKm;
// }
