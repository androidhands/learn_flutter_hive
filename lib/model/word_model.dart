import 'package:hive/hive.dart';

part 'word_model.g.dart';

@HiveType(typeId: 0)
class WordModel extends HiveObject {
  @HiveField(0)
  String text;
  @HiveField(1)
  bool isArabic;
  @HiveField(2)
  int colorCode;
  @HiveField(3)
  List<String> arabicSimilarWords;
  @HiveField(4)
  List<String> englishSimilarWords;
  @HiveField(5)
  List<String> arabiceExamples;
  @HiveField(6)
  List<String> englishExamples;

  WordModel({
    required this.text,
    required this.isArabic,
    required this.colorCode,
    required this.arabicSimilarWords,
   required this.englishSimilarWords ,
   required this.arabiceExamples ,
   required this.englishExamples ,
  });

  WordModel copyWith({
    String? text,
    bool? isArabic,
    int? colorCode,
    List<String>? arabicSimilarWords,
    List<String>? englishSimilarWords,
    List<String>? arabiceExamples,
    List<String>? englishExamples,
  }) {
    return WordModel(
      text: text ?? this.text,
      isArabic: isArabic ?? this.isArabic,
      colorCode: colorCode ?? this.colorCode,
      arabicSimilarWords: arabicSimilarWords ?? this.arabicSimilarWords,
      englishSimilarWords: englishSimilarWords ?? this.englishSimilarWords,
      arabiceExamples: arabiceExamples ?? this.arabiceExamples,
      englishExamples: englishExamples ?? this.englishExamples,
    );
  }
}
