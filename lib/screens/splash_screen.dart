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
          child: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset(
          'asset/360_F_74463388_hsKhitwolVzqJAzRPgaXG093NysvPqrx-removebg-preview.png',
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
        ),
      )),
    );
  }
}
