import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future addDate(
    {required titleEditingController,
    required discriptionEdController,
    required ctx}) async {
  final title = titleEditingController.text;
  final discription = discriptionEdController.text;
  final body = {
    "title": title,
    "description": discription,
    "is_completed": false
  };
  const url = "https://api.nstack.in/v1/todos";
  final uri = Uri.parse(url);
  final response = await http.post(
    uri,
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 201) {
    titleEditingController.text = '';
    discriptionEdController.text = '';
    showScatforldMassegTrue('Creation succuess', ctx);
  } else {
    showScatforldMassegFalse('Creation failer', ctx);
    // ignore: avoid_print
    print(response.body);
  }
}

showScatforldMassegTrue(String massege, ctx) {
  final snackBar = SnackBar(
    content: Text(massege),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
}

showScatforldMassegFalse(String massege, ctx) {
  final snackBar = SnackBar(
    content: Text(
      massege,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
}
