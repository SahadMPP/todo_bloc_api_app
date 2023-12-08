import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController discriptionEdController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('ADD TASK'),
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
                controller: titleEditingController,
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
                controller: discriptionEdController,
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
                        addDate(
                            titleEditingController: titleEditingController,
                            discriptionEdController: discriptionEdController,
                            ctx: context);
                      },
                      child: const Text('Add Task')))
            ],
          ),
        ),
      ),
    );
  }

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
}
