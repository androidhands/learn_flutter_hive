import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await Hive.openBox<String>("test");
                },
                child: Text('Open Hive Box')),
            ElevatedButton(
                onPressed: () {
                  Box textBox = Hive.box<String>("test");
                  print(textBox.isOpen);
                },
                child: Text('Access Hive Box'))
          ],
        ),
      ),
    );
  }
}
