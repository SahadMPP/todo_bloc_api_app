import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskInitial()) {
    on<AddTaskOnButtonClickEvent>(addTaskOnButtonClickEvent);
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

  FutureOr<void> addTaskOnButtonClickEvent(
      AddTaskOnButtonClickEvent event, Emitter<AddTaskState> emit) async {
    final title = event.textTitlecontroller.text;
    final discription = event.textDiscriptioncontroller.text;
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
      // titleEditingController.text = '';
      // discriptionEdController.text = '';
      showScatforldMassegTrue('Creation succuess', event.contex);
    } else {
      showScatforldMassegFalse('Creation failer', event.contex);
      // ignore: avoid_print
      print(response.body);
    }
  }
}
