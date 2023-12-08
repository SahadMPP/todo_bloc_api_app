import 'package:flutter/material.dart';
import 'package:to_do/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "todo",
        home: const Home(),
      ),
    );
  }
}
