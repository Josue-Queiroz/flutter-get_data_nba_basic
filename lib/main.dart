import 'package:flutter/material.dart';
import 'package:nba_app_api/pages/home_page.dart';
import 'package:nba_app_api/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (contex) => const IntroPage(),
        '/homepage': (context) => HomePage(),
      },
    );
  }
}
