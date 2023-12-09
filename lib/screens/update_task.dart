import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          'Update Task',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Title',
                style: GoogleFonts.roboto(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 77, 77, 77),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: titleEditController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 254, 237, 85),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'title',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Discription',
                style: GoogleFonts.roboto(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 77, 77, 77),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: discriptionEditController,
                maxLines: 5,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 254, 237, 85),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
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
                              BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.orange)),
                      onPressed: () {
                        updateData(
                            titleEditController: titleEditController,
                            discriptionEditController:
                                discriptionEditController,
                            context: context);
                      },
                      child: Text(
                        'update',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )))
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
