import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/Screens/deshboard.dart';
import 'package:securitymanagementsystem/providers/app_bar_notifier.dart';
import '../../widgets/app_bar.dart';
import 'system_msgs.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // calling notifier
    final appBarNotifier = Provider.of<AppBarNotifier>(context, listen: false);

    //set values
    appBarNotifier.setTitle('Inbox');
    appBarNotifier.setActions([
      IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Dashboard()));
      }, icon: const Icon(Icons.home)),
    ]);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
            ),
            title: Text('Sender Name'),
            subtitle: Text('Message preview'),
            trailing: Text('Timestamp'),
            onTap: () {
              // Navigate to the chat screen
            },
          );
        },
      ),
    );
  }
}
