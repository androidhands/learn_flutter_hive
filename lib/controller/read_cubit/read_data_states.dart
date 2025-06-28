part of 'read_data_cubit.dart';

abstract class ReadDataStates {}

class ReadDataInitialState extends ReadDataStates {}

class ReadDataLoadingState extends ReadDataStates {}

class ReadDataSuccessState extends ReadDataStates {
  final List<WordModel> words;
  ReadDataSuccessState(this.words);
}

class ReadDataErrorState extends ReadDataStates {
  final String message;
  ReadDataErrorState(this.message);
}
