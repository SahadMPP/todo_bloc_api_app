import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateTaskScreen extends StatelessWidget {
  final Map todo;
  const UpdateTaskScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditController = TextEditingController();
    TextEditingController discriptionEditController = TextEditingController();
    titleEditController.text = todo['title'];
    discriptionEditController.text = todo['description'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('UPDATE TASK'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextFormField(
                controller: titleEditController,
                decoration: const InputDecoration(
                  hintText: 'title',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: discriptionEditController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Discription',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                  width: 370,
                  height: 50,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              BeveledRectangleBorder()),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 44, 44, 44))),
                      onPressed: () {
                        updateData(
                            titleEditController: titleEditController,
                            discriptionEditController:
                                discriptionEditController,
                            context: context);
                      },
                      child: const Text('update')))
            ],
          ),
        ),
      ),
    );
  }

  Future updateData({
    required titleEditController,
    required discriptionEditController,
    required context,
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
}
