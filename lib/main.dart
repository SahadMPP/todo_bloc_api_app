import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/feature/splash/ui/splash_ui.dart';
import 'package:to_do/task/task_bloc.dart';

void main() {
  runApp(const MyApp());
}

final ValueNotifier<ThemeMode> themNotifier = ValueNotifier(ThemeMode.light);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => TaskBloc(),
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themNotifier,
        builder: (_, mode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: mode,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            title: "todo",
            home: const SplachScreen(),
          );
        },
      ),
    );
  }
}
