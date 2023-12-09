import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HomeCard(),
              Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18),
                child: SizedBox(
                  height: 420,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 180,
                        height: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BuildSmallBoxHome(
                                  text1: 'View',
                                  text2: 'Calender',
                                  image:
                                      'asset/images-calander-removebg-preview.png'),
                              BuildBIgBoxHome(
                                  text1: "Add New",
                                  text2: "Task",
                                  image:
                                      'asset/images__1_-removebg-preview.png'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BuildBIgBoxHome(
                                    text1: "View Today",
                                    text2: "Task",
                                    image:
                                        'asset/Screenshot 2023-12-09 165120.png'),
                                BuildSmallBoxHome(
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
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
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
          color: const Color.fromARGB(255, 249, 248, 248),
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
          color: const Color.fromARGB(255, 249, 248, 248),
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
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 230, 0),
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
              height: 250,
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
