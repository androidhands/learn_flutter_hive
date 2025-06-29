// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordModelAdapter extends TypeAdapter<WordModel> {
  @override
  final int typeId = 0;

  @override
  WordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordModel(
      text: fields[0] as String,
      isArabic: fields[1] as bool,
      colorCode: fields[2] as int,
      arabicSimilarWords: (fields[3] as List).cast<String>(),
      englishSimilarWords: (fields[4] as List).cast<String>(),
      arabiceExamples: (fields[5] as List).cast<String>(),
      englishExamples: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.isArabic)
      ..writeByte(2)
      ..write(obj.colorCode)
      ..writeByte(3)
      ..write(obj.arabicSimilarWords)
      ..writeByte(4)
      ..write(obj.englishSimilarWords)
      ..writeByte(5)
      ..write(obj.arabiceExamples)
      ..writeByte(6)
      ..write(obj.englishExamples);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
