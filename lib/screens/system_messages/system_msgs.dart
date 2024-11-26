import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/Screens/deshboard.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/cards.dart';
import 'inbox.dart';
import 'send_message/sendMessages.dart';

class SystemMessages extends StatefulWidget implements PreferredSizeWidget {
  const SystemMessages({super.key});

  @override
  State<SystemMessages> createState() => _SystemMessagesState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _SystemMessagesState extends State<SystemMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: 'System Messages',
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
              icon: const Icon(Icons.home),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ReusableCard(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InboxScreen()));
            },
            icon: const Icon(
              Icons.inbox,
              size: 60,
            ),
            text: 'Inbox',
          ),
          ReusableCard(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SendMessagesScreen()));
            },
            icon: const Icon(
              Icons.send,
              size: 60,
            ),
            text: 'Send Messages',
          ),
        ],
      ),
    );
  }
}
