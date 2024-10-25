import 'package:flutter/material.dart';
import 'package:memory_game_2/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xffAA4465),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              backgroundColor: const Color(0xffEDF0DA),
              title: const Center(
                child: Text(
                  'Memory Game',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Play',
                      letterSpacing: 2),
                ),
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          body: HomePage(),
        ));
  }
}
