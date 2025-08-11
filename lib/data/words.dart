import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vocabulift/models/word.dart';
import 'package:vocabulift/models/category.dart';

class WordsService {
  List<Word> _words = [];

  List<Word> get words => _words;

  Future<void> loadWords(Category category) async {
    final String jsonString = await rootBundle.loadString('assets/words.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    final List<dynamic>? wordsJson = jsonMap['categories']?[category.name];
    if (wordsJson == null) {
      throw Exception('Category ${category.name} not found');
    }

    _words = wordsJson.map((jsonWord) => Word.fromJson(jsonWord)).toList();
  }
}
