import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/feature/add_task/bloc/add_task_bloc.dart';

class DataAddUI extends StatelessWidget {
  const DataAddUI({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController discriptionEdController = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Your Task',
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: GoogleFonts.roboto(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 77, 77, 77),
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TextFormField(
                    controller: titleEditingController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the title';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Task Tile',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Discription',
                  style: GoogleFonts.roboto(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 77, 77, 77),
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TextFormField(
                    controller: discriptionEdController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the discription';
                      } else {
                        return null;
                      }
                    },
                    maxLines: 5,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      hintText: 'Task discription',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  width: 400,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.orange)),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AddTaskBloc>().add(
                              AddTaskOnButtonClickEvent(
                                  textTitlecontroller: titleEditingController,
                                  textDiscriptioncontroller:
                                      discriptionEdController,
                                  contex: context));
                        }
                      },
                      child: Text(
                        'Create',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
