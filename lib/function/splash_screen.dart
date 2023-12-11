import 'package:flutter/material.dart';
import 'package:to_do/build_widger/bottomnavigation.dart';

Future<void> enterToHome(context) async {
  await Future.delayed(const Duration(seconds: 3));
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const BuildBottomNavigator()),
      (route) => false);
}
