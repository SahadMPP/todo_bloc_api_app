import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
