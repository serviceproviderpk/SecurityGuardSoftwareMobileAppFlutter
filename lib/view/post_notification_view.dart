import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/post_notification_viewmodel.dart';

class PostNotificationView extends StatelessWidget {
  const PostNotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostNotificationViewModel>();

    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: messageController,
              decoration:
                  const InputDecoration(labelText: 'Notification Message'),
            ),
            const SizedBox(height: 20),
            viewModel.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      const int orgId = 185;
                      const int branchId = 186;
                      const int userId = 187;
                      final String message = messageController.text;

                      if (message.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Message cannot be empty'),
                        ));
                        return;
                      }

                      await viewModel.sendNotification(
                          orgId, branchId, userId, message);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(viewModel.message),
                      ));
                    },
                    child: const Text('Send Notification'),
                  )
          ],
        ),
      ),
    );
  }
}
