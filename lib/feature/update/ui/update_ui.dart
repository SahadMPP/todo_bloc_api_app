import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/feature/update/bloc/update_bloc.dart';

class UpdateTaskScreen extends StatelessWidget {
  final Map todo;
  const UpdateTaskScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditController = TextEditingController();
    TextEditingController discriptionEditController = TextEditingController();
    titleEditController.text = todo['title'];
    discriptionEditController.text = todo['description'];
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
          child: Form(
            key: formkey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    } else {
                      return null;
                    }
                  },
                  maxLines: 5,
                  decoration: const InputDecoration(
                    filled: true,
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
                          if (formkey.currentState!.validate()) {
                            context.read<UpdateBloc>().add(
                                UpdateDateOnButtonClick(
                                    textTitlecontroller: titleEditController,
                                    textDiscriptioncontroller:
                                        discriptionEditController,
                                    contex: context,
                                    todo: todo));
                            Navigator.of(context).pop();
                          }
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
      ),
    );
  }
}
