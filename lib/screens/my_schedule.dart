import 'package:flutter/material.dart';

class MySchedule extends StatelessWidget {
  const MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My Schedule"),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
