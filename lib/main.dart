import 'package:flutter/material.dart';
import 'package:sebi/pages/home.dart';
import 'package:sebi/pages/lesson_1.dart';
import 'package:sebi/pages/lesson_2.dart';
import 'package:sebi/pages/lesson_3.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: const HomePage(),
      routes: {
        '/lesson1': (context) => const lesson_1(),
        '/lesson2': (context) => const lesson_2(),
        '/lesson3': (context) => const lesson_3(),
      },
    );
  }
}
