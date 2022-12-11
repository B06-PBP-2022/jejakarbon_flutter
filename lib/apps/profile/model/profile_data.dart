// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

ProfileData profileDataFromJson(String str) => ProfileData.fromJson(json.decode(str));

String profileDataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
    ProfileData({
        required this.status,
        required this.username,
        required this.email,
        required this.isAdmin,
        required this.contact,
        required this.name,
        required this.organization,
    });

    bool status;
    String username;
    String email;
    bool isAdmin;
    String contact;
    String name;
    bool organization;

    factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        status: json["status"],
        username: json["username"],
        email: json["email"],
        isAdmin: json["is_admin"],
        contact: json["contact"],
        name: json["name"],
        organization: json["organization"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "username": username,
        "email": email,
        "is_admin": isAdmin,
        "contact": contact,
        "name": name,
        "organization": organization,
    };
}
