import 'package:egitim/Pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const THKUApp());
}

class THKUApp extends StatelessWidget {
  const THKUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
