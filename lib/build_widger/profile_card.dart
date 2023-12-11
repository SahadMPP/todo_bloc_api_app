import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildProfielCard extends StatelessWidget {
  final String title;
  final String? trallingText;
  final IconData leadingIcon;
  const BuildProfielCard({
    super.key,
    required this.title,
    this.trallingText,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ListTile(
          leading: Icon(
            leadingIcon,
            size: 27,
          ),
          title: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
            ),
          ),
          trailing: Text(
            trallingText ?? '',
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
            ),
          ),
        ),
      ),
    );
  }
}
