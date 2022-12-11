import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jejakarbon_flutter/apps/profile/model/profile_data.dart';

Future<ProfileData> fetchProfile(request) async {
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
