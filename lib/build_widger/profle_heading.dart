import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildProfileHeading extends StatelessWidget {
  final String heading;
  const BuildProfileHeading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 150),
      child: Text(
        heading,
        style: GoogleFonts.aBeeZee(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
