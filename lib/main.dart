import 'package:flutter/material.dart';
import 'package:postman_practice/example_four.dart';
import 'package:postman_practice/example_three.dart';
import 'package:postman_practice/example_two.dart';
import 'package:postman_practice/home_screen.dart';
import 'package:postman_practice/last_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LastScreen(),
    );
  }
}


