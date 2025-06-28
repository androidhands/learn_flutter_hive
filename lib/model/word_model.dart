class WordModel {
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabiceExamples;
  final List<String> englishExamples;

  WordModel({
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabiceExamples = const [],
    this.englishExamples = const [],
  });

  WordModel deleteExample(int index, bool isArabic) {
    List<String> newExampleWords = _initializeNewExampleWords(isArabic);
    newExampleWords.removeAt(index);
    return _getWordAfterCheckExampleWords(newExampleWords, isArabic);
  }

  WordModel addExample(String example, bool isArabic) {
    List<String> newExampleWords = _initializeNewExampleWords(isArabic);
    newExampleWords.add(example);
    return _getWordAfterCheckExampleWords(newExampleWords, isArabic);
  }

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

  List<String> _initializeNewExampleWords(bool isArabic) {
    if (isArabic) {
      return [...arabiceExamples];
    } else {
      return [...englishExamples];
    }
  }

  WordModel _getWordAfterCheckSimilarWords(
      List<String> newSimilarWords, bool isArabic) {
    return WordModel(
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: isArabic ? newSimilarWords : arabicSimilarWords,
      englishSimilarWords: isArabic ? englishSimilarWords : newSimilarWords,
      arabiceExamples: arabiceExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel _getWordAfterCheckExampleWords(
      List<String> newExapleWords, bool isArabic) {
    return WordModel(
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabiceExamples: isArabic ? newExapleWords : arabiceExamples,
      englishExamples: isArabic ? englishExamples : newExapleWords,
    );
  }
}
