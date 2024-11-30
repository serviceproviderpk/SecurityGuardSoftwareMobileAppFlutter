import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_bar_notifier.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarNotifier = Provider.of<AppBarNotifier>(context);

    return AppBar(
      title: Center(
          child: Text(
        appBarNotifier.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      actions: appBarNotifier.actions,
    );
  }
}
