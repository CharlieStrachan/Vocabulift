class Word {
  final String word;
  final String definition;
  final String pronunciation;

  Word({
    required this.word,
    required this.definition,
    required this.pronunciation,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      definition: json['definition'],
      pronunciation: json['pronunciation'],
    );
  }
}
