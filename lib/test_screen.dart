import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  late Box box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  box = await Hive.openBox("test");
                },
                child: Text("open box")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  box.put(10, [0, 1, 2, 3]);
                },
                child: Text("Add data")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  List list = box.get(10);
                  list[0] = 100;
                  print(box.get(10));
                  print(list);
                },
                child: Text("Change data")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  print(box.get(10));
                },
                child: Text("Display data")),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                onPressed: () async {
                  await box.clear();
                },
                child: Text("Clear data"))
          ],
        ),
      ),
    );
  }
}
