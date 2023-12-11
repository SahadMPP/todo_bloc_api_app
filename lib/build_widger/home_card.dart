import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
