import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/function/add_data.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController discriptionEdController = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Container(
      decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 231, 231, 231),
          ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const Divider(
                  color: Colors.orange,
                  endIndent: 165,
                  indent: 165,
                  thickness: 5,
                ),
                const SizedBox(height: 10),
                const Divider(
                  endIndent: 15,
                  indent: 15,
                ),
                const SizedBox(height: 10),
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
                      fillColor: Colors.white,
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
                      fillColor: Colors.white,
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
                          addDate(
                              titleEditingController: titleEditingController,
                              discriptionEdController: discriptionEdController,
                              ctx: context);
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
                const SizedBox(height: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
