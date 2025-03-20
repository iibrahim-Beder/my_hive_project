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
                  box.putAll({
                    "name": "ibrahim",
                    9: true,
                    "age": 30,
                    0: false,
                    2: [9, 2, 6]
                  });
                },
                child: Text("put data")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  box.putAt(2, "mohamed");
                },
                child: Text("use put at method")),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  print(box.values);
                },
                child: Text("Display data"))
          ],
        ),
      ),
    );
  }
}
