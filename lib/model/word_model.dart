class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabiceExamples;
  final List<String> englishExamples;

  WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabiceExamples = const [],
    this.englishExamples = const [],
  });

  WordModel addSimilarWord(String word, bool isArabic) {
    List<String> newSimilarWords = [];
    if (isArabic) {
      newSimilarWords = [...arabicSimilarWords, word];
    } else {
      newSimilarWords = [...englishSimilarWords, word];
    }

    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: isArabic ? newSimilarWords : arabicSimilarWords,
      englishSimilarWords: isArabic ? englishSimilarWords : newSimilarWords,
      arabiceExamples: arabiceExamples,
      englishExamples: englishExamples,
    );
  }
}
