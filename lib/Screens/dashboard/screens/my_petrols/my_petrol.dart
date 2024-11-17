import 'package:flutter/material.dart';

class myPetrol extends StatelessWidget {
  const myPetrol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My Petrol"),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
