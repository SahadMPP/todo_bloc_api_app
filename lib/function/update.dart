import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future updateData({
  required titleEditController,
  required discriptionEditController,
  required context,
  required todo,
}) async {
  const snackBar = SnackBar(
    content: Text('updated'),
    backgroundColor: Colors.white,
  );
  const snackBarF = SnackBar(
    content: Text('Not updated'),
    backgroundColor: Colors.red,
  );

  final title = titleEditController.text;
  final discription = discriptionEditController.text;
  final body = {
    "title": title,
    "description": discription,
    "is_completed": false
  };
  final id = todo['_id'];
  final url = "https://api.nstack.in/v1/todos/$id";
  final uri = Uri.parse(url);
  final response = await http.put(
    uri,
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    titleEditController.text = '';
    discriptionEditController.text = '';
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(snackBarF);
    print(response.body);
  }
}
