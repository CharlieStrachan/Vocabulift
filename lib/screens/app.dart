import 'package:flutter/material.dart';
import 'package:vocabulift/constants.dart';
import 'package:vocabulift/data/words.dart';
import 'package:vocabulift/screens/onboarding.dart';
import 'package:vocabulift/widgets/appbar.dart';
import 'package:vocabulift/models/word.dart';
import 'package:vocabulift/models/category.dart';
import 'package:vocabulift/widgets/button.dart';
import 'package:vocabulift/widgets/text.dart';

class App extends StatefulWidget {
  final Category category;
  const App({super.key, required this.category});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _index = 0;
  Word _currentWord = Word(word: "", definition: "", pronunciation: "");
  late WordsService vocabularyData;

  @override
  void initState() {
    super.initState();
    vocabularyData = WordsService();
    _loadWords();
  }

  Future<void> _loadWords() async {
    await vocabularyData.loadWords(widget.category);
    setState(() {
      if (vocabularyData.words.isNotEmpty) {
        _currentWord = vocabularyData.words[_index];
      }
    });
  }

  void _nextWord() {
    setState(() {
      _index++;
      if (_index >= vocabularyData.words.length) {
        _index = 0;
      }
      _currentWord = vocabularyData.words[_index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[0],
      appBar: CustomAppBar(
        title: "Vocabulift - Home",
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Onboarding()));
            },
            icon: Icon(Icons.logout),
            color: colors[3],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: _currentWord.word, fontSize: 24),
              CustomText(text: _currentWord.pronunciation, faded: true),
              SizedBox(height: 10),
              CustomText(text: _currentWord.definition),
              SizedBox(height: 10),
              Button(onTap: _nextWord, text: "Next Word"),
            ],
          ),
        ),
      ),
    );
  }
}
