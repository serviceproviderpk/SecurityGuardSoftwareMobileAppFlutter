import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const ReusableCard(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 190,
        height: 190,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
