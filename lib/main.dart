import 'package:flutter/material.dart';
import 'package:vocabulift/screens/app.dart';
import 'package:vocabulift/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Vocabulift());
}

class Vocabulift extends StatefulWidget {
  const Vocabulift({super.key});

  @override
  State<Vocabulift> createState() => _VocabuliftState();
}

class _VocabuliftState extends State<Vocabulift> {
  bool? _showOnboarding;
  int _category = 0;

  @override
  void initState() {
    super.initState();
    _getPreferences();
  }

  Future<void> _getPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _showOnboarding = prefs.getBool("showOnboarding") ?? true;
      _category = prefs.getInt("category") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _showOnboarding == true
          ? const Onboarding()
          : App(category: _category)
    );
  }
}
