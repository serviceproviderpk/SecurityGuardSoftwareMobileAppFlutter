import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/Screens/system_messages/system_msgs.dart';
import 'package:securitymanagementsystem/providers/app_bar_notifier.dart';
import 'package:securitymanagementsystem/widgets/app_bar.dart';

class WriteMessage extends StatelessWidget {
  const WriteMessage({super.key});

  @override
  Widget build(BuildContext context) {

    // calling notifier
    final appBarNotifier = Provider.of<AppBarNotifier>(context, listen: false);

    // setting values
    appBarNotifier.setTitle('Write Your Message');
    appBarNotifier.setActions([
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SystemMessages()));
      }, icon: const Icon(Icons.home)),
    ]);

    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: CustomAppBar()),
      body: Center(child: Text('Hello please write your message here'),),
    );
  }
}
