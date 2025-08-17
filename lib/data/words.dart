import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vocabulift/models/word.dart';

class WordsService {
  List<Word> _words = [];

  List<Word> get words => _words;

  final List<String> _categories = [
    "General",
    "Business",
    "Arts",
    "Technology",
    "Science",
  ];

  Future<void> loadWords(int category) async {
    final String jsonString = await rootBundle.loadString('assets/data/words.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    final List<dynamic>? wordsJson = jsonMap['categories']?[_categories[category]];
    if (wordsJson == null) {
      throw Exception('Category ${_categories[category]} not found');
    }

    _words = wordsJson.map((jsonWord) => Word.fromJson(jsonWord)).toList();
  }
}
