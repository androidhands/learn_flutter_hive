import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);
  late Box box;
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
                  box = await Hive.openBox("test");
                },
                child: Text('Open Hive Box')),
            ElevatedButton(
                onPressed: () {
                  // the put method is a future but can be used without await
                  // it add or update data in the box so in key not added it will create a new key
                  // if the key is already present it will update the value
                  /* box.put("name", "Abdelhamid");
                  box.put("age", 35); */
                  box.putAll({
                    "name": "Abdelhamid Ahmed",
                    "age": 30,
                  });
                },
                child: Text('Put Data')),
            ElevatedButton(
                onPressed: () {
                  String? name = box.get("name");
                  int? age = box.get("age");
                  print('Name: $name, Age: $age');
                },
                child: Text('Display Data')),
          ],
        ),
      ),
    );
  }
}
