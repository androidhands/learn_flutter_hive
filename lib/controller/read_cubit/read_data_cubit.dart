import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter_hive/model/word_model.dart';
import 'package:learn_flutter_hive/utils/app_constants.dart';
import 'package:learn_flutter_hive/utils/enums.dart';

part 'read_data_states.dart';

class ReadDataCubit extends Cubit<ReadDataStates> {
  static get(context) => BlocProvider.of(context);
  ReadDataCubit() : super(ReadDataInitialState());

  final Box _box = Hive.box(AppConstants.boxName);
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

  void getWords() async {
    emit(ReadDataLoadingState());
    try {
      List<WordModel> wordsToDisplay = [
        ..._box.get(AppConstants.wordList, defaultValue: <WordModel>[])
      ].cast<WordModel>();
    } catch (error) {
      emit(ReadDataErrorState(
          'We could not load the words, Please try again later.'));
    }
  }
}
