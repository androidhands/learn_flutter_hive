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
                    9: true,
                    "age": 30,
                    1: 'Test',
                    2: 3.14,
                    3: [1, 2, 3],
                  });
                },
                child: Text('Put Data')),
            ElevatedButton(
                onPressed: () {
                  // the putAt method is used to put data at a specific index
                  // it will not create a new key if the key is not present
                  // it will update the value at the index if the index is already present
                  // it will not create a new index if the index is not present
                  // so it will not create a new key if the key is not present
                  // it collect the int key and arrarngs them in array and used the index to put the value
                  box.putAt(1, 'Abdo');
                },
                child: Text('Put At')),
            ElevatedButton(
                onPressed: () {
                  box.getAt(0);
                },
                child: Text('Get At')),
            ElevatedButton(
                onPressed: () {
                  // this method is used to add values only without using a key
                  // it searchs for the maximum key in the box and adds the value to the next key(int)
                  box.add("Boody");
                  box.addAll([
                    9,
                    "Ahmed",
                    3.14,
                    [1, 2, 3],
                    true
                  ]);
                },
                child: Text('Add And Add All')),
            ElevatedButton(
                onPressed: () {
                  for (var k in box.keys) {
                    print("Key: $k, Value: ${box.get(k)}}");
                  }
                },
                child: Text('Display Data')),
            ElevatedButton(
                onPressed: () {
                  print(box.values);
                },
                child: Text('Display Box Values')),
          ],
        ),
      ),
    );
  }
}
