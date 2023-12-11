import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:to_do/main.dart';
import 'package:to_do/screens/search_screen.dart';

AppBar appbar(context) {
  return AppBar(
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
  );
}
