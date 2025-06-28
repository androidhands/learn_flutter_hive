import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter_hive/model/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  final int typeId = 0;

  @override
  WordModel read(BinaryReader reader) {
    return WordModel(
      indexAtDatabase: reader.readInt(),
      text: reader.readString(),
      isArabic: reader.readBool(),
      colorCode: reader.readInt(),
      arabicSimilarWords: reader.readStringList(),
      englishSimilarWords: reader.readStringList(),
      arabiceExamples: reader.readStringList(),
      englishExamples: reader.readStringList(),
    );
  }

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer.writeInt(obj.indexAtDatabase);
    writer.writeString(obj.text);
    writer.writeBool(obj.isArabic);
    writer.writeInt(obj.colorCode);
    writer.writeStringList(obj.arabicSimilarWords);
    writer.writeStringList(obj.englishSimilarWords);
    writer.writeStringList(obj.arabiceExamples);
    writer.writeStringList(obj.englishExamples);
  }
}
