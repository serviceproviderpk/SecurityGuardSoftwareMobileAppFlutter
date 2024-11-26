import 'package:flutter/material.dart';

class myLeaveBalance extends StatelessWidget {
  const myLeaveBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My Leave Balance"),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
