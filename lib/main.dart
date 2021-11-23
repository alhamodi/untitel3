import 'package:flutter/material.dart';
import 'package:untitled3/layout/home_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.brown
    ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
