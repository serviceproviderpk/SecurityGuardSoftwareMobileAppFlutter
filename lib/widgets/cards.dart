import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/card_notifier.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardNotifier = Provider.of<CardNotifier>(context);

    return GestureDetector(
      onTap: cardNotifier.action,
      child: SizedBox(
        width: 190,
        height: 190,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  cardNotifier.iconData,
                  size: 60.0,
                  color: Colors.blue,
                ),
                SizedBox(height: 15.0),
                Container(
                  width: 250,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      cardNotifier.title,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:securitymanagementsystem/providers/card_notifier.dart';
//
// class ReusableCard extends StatelessWidget {
//   final Icon icon;
//   final String text;
//   final VoidCallback onTap;
//
//   const ReusableCard(
//       {super.key, required this.icon, required this.text, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final cardNotifier = Provider.of<CardNotifier>(context, listen: false);
//     return SizedBox(
//         width: 190,
//         height: 190,
//         child: GestureDetector(
//           onTap:
//           child: Card(
//             margin: const EdgeInsets.all(10),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   icon,
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Text(
//                     text,
//                     style: const TextStyle(
//                       fontSize: 14.5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
