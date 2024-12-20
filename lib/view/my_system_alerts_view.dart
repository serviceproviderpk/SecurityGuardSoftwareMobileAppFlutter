import 'package:flutter/material.dart';

class MySystemAlertsView extends StatelessWidget {
  const MySystemAlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Row(
            children: [
              Text('System Alerts!'),
              Icon(
                Icons.add_alert,
                color: Colors.red,
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
