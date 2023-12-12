import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/build_widger/profile_card.dart';
import 'package:to_do/build_widger/profle_heading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage('asset/images (10).jpg'),
          ),
          const SizedBox(height: 25),
          Text(
            'Viktoria Header',
            style: GoogleFonts.aBeeZee(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Active',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 50),
          const BuildProfileHeading(heading: 'Personal Information'),
          const SizedBox(height: 10),
          const BuildProfielCard(
              title: 'Email',
              trallingText: "sahad@gmail.com",
              leadingIcon: Icons.email),
          const SizedBox(height: 2),
          const BuildProfielCard(
              title: 'Phone',
              trallingText: "+91 9383593670",
              leadingIcon: Icons.phone_android),
          const SizedBox(height: 2),
          const BuildProfielCard(
              title: 'WebSite',
              trallingText: "www.sahaddev.com",
              leadingIcon: Icons.web),
          const SizedBox(height: 2),
          const BuildProfielCard(
            title: 'Location',
            trallingText: "Kannur",
            leadingIcon: Icons.place,
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(right: 130),
            child: BuildProfileHeading(heading: 'Utilities'),
          ),
          const SizedBox(height: 10),
          const BuildProfielCard(
              title: 'LogOut', leadingIcon: Icons.logout_outlined),
          const SizedBox(height: 70),
        ],
      ),
    ));
  }
}
