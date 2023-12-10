import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  color: Colors.black,
                ),
              ),
              Text(
                'Active',
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 25),
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
          color: Colors.black,
        ),
      ),
    );
  }
}

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
      child: Container(
        height: 60,
        width: double.infinity,
        color: const Color.fromARGB(255, 231, 229, 229),
        child: ListTile(
          leading: Icon(
            leadingIcon,
            size: 27,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
            ),
          ),
          trailing: Text(
            trallingText ?? '',
            style: GoogleFonts.aBeeZee(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: .5,
            ),
          ),
        ),
      ),
    );
  }
}
