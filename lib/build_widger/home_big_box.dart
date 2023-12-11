import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
