import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/screens/init_activity/sketch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sketch(),
    );
  }
}
