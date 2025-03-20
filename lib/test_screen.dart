import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [

            ElevatedButton(
                onPressed: () async {
                  await Hive.openBox<String>("test");
                },
                
                child: Text("Open box")),

                SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {
                Box testBox =  Hive.box<String>("test");
                },
                child: Text("Access box"))
          ],
        ),
      ),
    );
  }
}
