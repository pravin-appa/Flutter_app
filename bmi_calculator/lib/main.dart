
import 'package:flutter/material.dart';
import 'pages/input_page.dart';


void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF090C22)),
        scaffoldBackgroundColor: const Color(0xFF090C22),
      ),

    );
  }
}

