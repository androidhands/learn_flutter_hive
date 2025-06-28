import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_hive/model/word_model.dart';

part 'read_data_states.dart';

class ReadDataCubit extends Cubit<ReadDataInitialState> {
  static get(context) => BlocProvider.of(context);
  ReadDataCubit() : super(ReadDataInitialState());
}
