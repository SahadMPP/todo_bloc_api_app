import 'package:flutter/material.dart';
import 'package:to_do/function/splash_screen.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    enterToHome(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: Center(
          child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 250),
        duration: const Duration(milliseconds: 1500),
        builder: (context, size, widget) {
          return SizedBox(
            height: size,
            width: size,
            child: Image.asset(
              'asset/download (2).png',
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ),
          );
        },
      )),
    );
  }
}
