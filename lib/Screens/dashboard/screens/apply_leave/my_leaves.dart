import 'package:flutter/material.dart';

class myLeaves extends StatelessWidget {
  const myLeaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My Leaves"),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
