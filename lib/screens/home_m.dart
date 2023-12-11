import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/main.dart';
import 'package:to_do/screens/list_of_task.dart';
import 'package:http/http.dart' as http;
import 'package:to_do/screens/search_screen.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const SearchScreen()));
              },
              child: Container(
                height: 45,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: Colors.grey,
                    width: .9,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Search here',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 45,
              child: ValueListenableBuilder<ThemeMode>(
                valueListenable: themNotifier,
                builder: (_, mode, __) {
                  return LiteRollingSwitch(
                    onTap: () {
                      themNotifier.value = mode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    },
                    onDoubleTap: () {},
                    onSwipe: () {},
                    onChanged: (value) {},
                    value: true,
                    textOn: 'lite',
                    textOff: 'dark',
                    colorOn: const Color.fromARGB(255, 215, 215, 215),
                    textSize: 18,
                    width: 100,
                    colorOff: Colors.black,
                    iconOn: Icons.light_mode,
                    iconOff: Icons.dark_mode,
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const HomeCard(),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: SizedBox(
                  height: 420,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 180,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(3000));
                                },
                                child: const BuildSmallBoxHome(
                                    text1: 'View',
                                    text2: 'Calender',
                                    image:
                                        'asset/images-calander-removebg-preview.png'),
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return const BuildBottomSheet();
                                      });
                                },
                                child: const BuildBIgBoxHome(
                                    text1: "Add New",
                                    text2: "Task",
                                    image:
                                        'asset/images__1_-removebg-preview.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const ListOfTask()));
                                  },
                                  child: const BuildBIgBoxHome(
                                      text1: "View All",
                                      text2: "Task",
                                      image:
                                          'asset/Screenshot 2023-12-09 165120.png'),
                                ),
                                const BuildSmallBoxHome(
                                    text1: 'View',
                                    text2: 'My Status',
                                    image:
                                        'asset/images__8_-removebg-preview.png'),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
}

class BuildBIgBoxHome extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;
  const BuildBIgBoxHome({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 242, 242),
          borderRadius: BorderRadius.circular(32)),
      height: 230,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                image,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                text1,
                style: GoogleFonts.aBeeZee(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 12, 11, 42),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                text2,
                style: GoogleFonts.aBeeZee(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 12, 11, 42),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildSmallBoxHome extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;
  const BuildSmallBoxHome({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 242, 242),
          borderRadius: BorderRadius.circular(32)),
      height: 120,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: GoogleFonts.aBeeZee(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: const Color.fromARGB(255, 12, 11, 42),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text2,
                style: GoogleFonts.aBeeZee(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 12, 11, 42),
                ),
              ),
              SizedBox(
                height: 35,
                width: 35,
                child: Image.asset(
                  image,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 166, 0),
                borderRadius: BorderRadius.circular(28)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 140,
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Let\'s Set-Up Your Live Now!!',
                          style: GoogleFonts.roboto(
                            fontSize: 27,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                      onPressed: () {},
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 200, 175, 9),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              width: 160,
              child: Image.asset(
                'asset/Screenshot_2023-12-09_143553-removebg-preview.png',
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
