import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter_hive/model/word_model.dart';
import 'package:learn_flutter_hive/utils/app_constants.dart';
import 'package:learn_flutter_hive/utils/enums.dart';

part 'read_data_states.dart';

class ReadDataCubit extends Cubit<ReadDataStates> {
  ReadDataCubit() : super(ReadDataInitialState());

  final Box _box = Hive.box<WordModel>(AppConstants.boxName);
  LanguageFilter languageFilter = LanguageFilter.allWords;
  SortBy sortBy = SortBy.time;
  SortType sortType = SortType.descending;

  void updateLanguageFilter(LanguageFilter filter) {
    languageFilter = filter;
  }

  void updateSortBy(SortBy sort) {
    sortBy = sort;
  }

  void updateSortType(SortType type) {
    sortType = type;
  }

  void addWord() async {
    emit(ReadDataLoadingState());
    try {
      // Add example word for testing (you can remove this in production)
      WordModel word = WordModel(
        text: 'Example',
        isArabic: false,
        colorCode: Random().nextInt(0xFFFFFF),
        arabicSimilarWords: [],
        englishSimilarWords: [],
        arabiceExamples: [],
        englishExamples: [],
      );
      await _box.add(word);
      getWords(); // Refresh the list
    } catch (error) {
      emit(ReadDataErrorState(
          'We could not add the word, Please try again later.'));
    }
  }

  void getWords() async {
    emit(ReadDataLoadingState());
    try {
      // Add example word for testing (you can remove this in production)

      // Get all key-value pairs from the box as a map
      Map<dynamic, dynamic> wordsMap = _box.toMap();
      debugPrint('Words Map: $wordsMap');

      // Convert map values to list for the UI
      List<WordModel> wordsList = wordsMap.values.cast<WordModel>().toList();
      emit(ReadDataSuccessState(wordsList));
    } catch (error) {
      emit(ReadDataErrorState(
          'We could not load the words, Please try again later.'));
    }
  }

  void deleteWordByDatabaseIndex(WordModel word) async {
    emit(ReadDataLoadingState());
    try {
      await word.delete(); // Use the delete method from HiveObject
      getWords(); // Refresh the list
    } catch (error) {
      emit(ReadDataErrorState(
          'We could not delete the word, Please try again later.'));
    }
  }

  void updateWord(WordModel word)async{
    try {
      // Update the word in the box
      await word.save(); // Use the save method from HiveObject
      getWords(); // Refresh the list
    } catch (error) {
      emit(ReadDataErrorState(
          'We could not update the word, Please try again later.'));
    }
  }
}
