import 'package:flutter/material.dart';
import 'package:vocabulift/screens/onboarding.dart';

void main() async {
  runApp(const Vocabulift());
}

class Vocabulift extends StatelessWidget {
  const Vocabulift({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}
