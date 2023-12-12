import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:meta/meta.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitial()) {
    on<UpdateDateOnButtonClick>(updateDateOnButtonClick);
  }

  FutureOr<void> updateDateOnButtonClick(
      UpdateDateOnButtonClick event, Emitter<UpdateState> emit) async {
    const snackBar = SnackBar(
      content: Text('updated'),
      backgroundColor: Colors.white,
    );
    const snackBarF = SnackBar(
      content: Text('Not updated'),
      backgroundColor: Colors.red,
    );

    final title = event.textTitlecontroller.text;
    final discription = event.textDiscriptioncontroller.text;
    final body = {
      "title": title,
      "description": discription,
      "is_completed": false
    };
    final id = event.todo['_id'];
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // titleEditController.text = '';
      // discriptionEditController.text = '';
      ScaffoldMessenger.of(event.contex).showSnackBar(snackBar);
    } else {
      ScaffoldMessenger.of(event.contex).showSnackBar(snackBarF);
      print(response.body);
    }
  }
}
