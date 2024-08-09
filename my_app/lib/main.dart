import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart'; // Ensure this path matches your actual project structure

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
