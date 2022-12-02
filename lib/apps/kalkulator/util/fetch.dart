import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pbp_flutter_tutorial/model/to_do.dart';

Future<List<Todo>> fetchToDo() async {
  var url = Uri.parse(
      'https://jsonplaceholder.typicode.com/todos?_start=0&_limit=10');
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
  List<Todo> listToDo = [];
  for (var d in data) {
    if (d != null) {
      listToDo.add(Todo.fromJson(d));
    }
  }

  return listToDo;
}