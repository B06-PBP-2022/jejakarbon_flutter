// To parse this JSON data, do
//
//     final faq = faqFromJson(jsonString);

import 'dart:convert';

List<Faq> faqFromJson(String str) => List<Faq>.from(json.decode(str).map((x) => Faq.fromJson(x)));

String faqToJson(List<Faq> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faq {
    Faq({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Faq.fromJson(Map<String, dynamic> json) => Faq(
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
        required this.question,
        required this.answer,
        required this.username,
    });

    int user;
    String question;
    String answer;
    String username;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        question: json["question"],
        answer: json["answer"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "question": question,
        "answer": answer,
        "username": username,
    };
}
