import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';
import 'system_msgs.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: 'Inbox',
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to the send message screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SystemMessages()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual message count
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
