import 'package:bmi_app/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMIku());
}

class BMIku extends StatelessWidget {
  const BMIku({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const HomePage());
  }
}
