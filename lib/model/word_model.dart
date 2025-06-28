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


}
