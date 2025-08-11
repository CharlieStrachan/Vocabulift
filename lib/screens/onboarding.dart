import 'package:flutter/material.dart';
import 'package:vocabulift/constants.dart';
import 'package:vocabulift/screens/app.dart';
import 'package:vocabulift/widgets/appbar.dart';
import 'package:vocabulift/models/category.dart';
import 'package:vocabulift/widgets/button.dart';
import 'package:vocabulift/widgets/text.dart';

final List<String> _labels = [
  "General",
  "Business",
  "Arts",
  "Technology",
  "Science",
];
final List<Category> _categories = [
  Category.general,
  Category.business,
  Category.arts,
  Category.technology,
  Category.science,
];

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late Category _category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[0],
      appBar: CustomAppBar(title: "Vocabulift - Onboarding"),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomText(
                  text: "What category of words would you like to learn?",
                  fontSize: 24,
                ),
                SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 4,
                  runSpacing: 4,
                  children: List.generate(_categories.length, (index) {
                    return Button(
                      onTap: () {
                        setState(() {
                          _category = _categories[index];
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => App(category: _category),
                            ),
                          );
                        });
                      },
                      text: _labels[index],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
