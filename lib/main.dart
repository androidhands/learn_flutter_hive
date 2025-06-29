import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter_hive/controller/read_cubit/read_data_cubit.dart';
import 'package:learn_flutter_hive/model/word_model.dart';

import 'package:learn_flutter_hive/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordModelAdapter());

  // Clear the existing box if it exists (due to structure change)
  try {
    await Hive.deleteBoxFromDisk(AppConstants.boxName);
  } catch (e) {
    print('Box does not exist or already deleted: $e');
  }

  await Hive.openBox<WordModel>(AppConstants.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Example'),
      ),
      body: BlocProvider(
          create: (context) =>
              ReadDataCubit()..getWords(), // Call getWords() on creation
          child: BlocBuilder<ReadDataCubit, ReadDataStates>(
            builder: (context, state) {
              if (state is ReadDataSuccessState) {
                return Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<ReadDataCubit>().addWord();
                        },
                        child: Text('Add Word')),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.words.length,
                        itemBuilder: (context, index) {
                          WordModel word = state.words[index];
                          return ListTile(
                            title: Text(word.text),
                            subtitle: Text('DB Index: '),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Update using indexAtDatabase (not list index!)
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Delete using indexAtDatabase (not list index!)
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is ReadDataLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ReadDataErrorState) {
                return Center(child: Text(state.message));
              } else {
                return Center(
                    child: Column(
                  children: [
                    Text('No data available'),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ReadDataCubit>().addWord();
                        },
                        child: Text('Add Word')),
                  ],
                ));
              }
            },
          )),
    );
  }
}
