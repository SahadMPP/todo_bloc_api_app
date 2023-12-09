import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/screens/home_m_.dart';
import 'package:to_do/task/task_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => TaskBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "todo",
        home: HomeMain(),
      ),
    );
  }
}
