import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jejakarbon_flutter/apps/profile/model/profile_data.dart';
import 'package:jejakarbon_flutter/apps/profile/model/carbon_history.dart';
import 'package:jejakarbon_flutter/apps/profile/model/donation_history.dart';
import 'package:jejakarbon_flutter/apps/profile/model/opened_donation.dart';

Future<ProfileData> fetchProfileData(request) async {
  // var url =
  //     Uri.parse('https://jejakarbon.up.railway.app/profile/profile-json/');
  var profileResponse = await request
      .get('https://jejakarbon.up.railway.app/profile/profile-json/'
          // headers: {
          //   "Access-Control-Allow-Origin": "*",
          //   "Content-Type": "application/json",
          // },
          );

  // melakukan decode response menjadi bentuk json
  // print(utf8.decode(profileResponse.bodyBytes));
  // var data = jsonDecode(utf8.decode(profileResponse.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  // List<ProfileData> listProfileData = [];
  // for (var d in profileResponse.keys.toList()) {
  //   if (d != null) {
  //     listProfileData.add(ProfileData.fromJson(d));
  //   }
  // }

  ProfileData data = ProfileData.fromJson(profileResponse);

  // return listProfileData;
  return data;
}

Future<List<CarbonHistory>> fetchCarbonHistory(request) async {
  // var url = Uri.parse(
  //     'https://jejakarbon.up.railway.app/profile/carbon-history-flutter/');
  var response = await request
      .get('https://jejakarbon.up.railway.app/profile/carbon-history-flutter/');

  // melakukan decode response menjadi bentuk json
  // var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<CarbonHistory> listCarbonHistory = [];
  for (var d in response) {
    if (d != null) {
      listCarbonHistory.add(CarbonHistory.fromJson(d));
    }
  }

  return listCarbonHistory;
}

Future<List<DonationHistory>> fetchDonationHistory(request) async {
  // var url = Uri.parse(
  //     'https://jejakarbon.up.railway.app/profile/donation-history-flutter/');
  var response = await request.get(
      'https://jejakarbon.up.railway.app/profile/donation-history-flutter/');

  // melakukan decode response menjadi bentuk json
  // var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<DonationHistory> listDonationHistory = [];
  for (var d in response) {
    if (d != null) {
      listDonationHistory.add(DonationHistory.fromJson(d));
    }
  }

  return listDonationHistory;
}

Future<List<OpenedDonation>> fetchOpenedDonation(request) async {
  // var url = Uri.parse(
  //     'https://jejakarbon.up.railway.app/profile/opened-donation-flutter/');
  var response = await request.get(
      'https://jejakarbon.up.railway.app/profile/opened-donation-flutter/');

  // melakukan decode response menjadi bentuk json
  // var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<OpenedDonation> listOpenedDonation = [];
  for (var d in response) {
    if (d != null) {
      listOpenedDonation.add(OpenedDonation.fromJson(d));
    }
  }

  return listOpenedDonation;
}
