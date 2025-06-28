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
    List<String> newSimilarWords = _initializeSimilarWords(isArabic);
    newSimilarWords.add(word);
    return _getWordAfterCheckSimilarWords(newSimilarWords, isArabic);
  }

  WordModel deleteSimilarWord(int index, bool isArabic) {
    List<String> newSimilarWords = _initializeSimilarWords(isArabic);
    newSimilarWords.removeAt(index);
    return _getWordAfterCheckSimilarWords(newSimilarWords, isArabic);
  }

  List<String> _initializeSimilarWords(bool isArabic) {
    if (isArabic) {
      return [...arabicSimilarWords];
    } else {
      return [...englishSimilarWords];
    }
  }

  WordModel _getWordAfterCheckSimilarWords(
      List<String> newSimilarWords, bool isArabic) {
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
