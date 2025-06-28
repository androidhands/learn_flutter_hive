import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter_hive/model/word_model.dart';
import 'package:learn_flutter_hive/utils/app_constants.dart';

part 'read_data_states.dart';

class ReadDataCubit extends Cubit<ReadDataInitialState> {
  static get(context) => BlocProvider.of(context);
  ReadDataCubit() : super(ReadDataInitialState());

  final Box _box = Hive.box(AppConstants.boxName);
}
