import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'deshboard.dart';

class Checkinoutscreen extends StatelessWidget {
  const Checkinoutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Check-In and Check-Out',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle button press
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()));
                      },
                      icon: Icon(Icons.check_box),
                      label: Text('Check-In'),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle button press
                        Navigator.push(
                            context,
                            DialogRoute(
                                context: context,
                                builder: (context) => LoginScreen()));
                      },
                      icon: const Icon(Icons.outbond),
                      label: const Text('Check-Out'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
