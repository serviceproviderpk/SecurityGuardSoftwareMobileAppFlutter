import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/inbox_viewmodel.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<InboxViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Guard Alerts'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<InboxViewModel>(
        builder: (_, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.messages.isEmpty) {
            return Center(child: Text(viewModel.statusMessage));
          }

          return ListView.builder(
            itemCount: viewModel.messages.length,
            itemBuilder: (context, index) {
              final message = viewModel.messages[index];
              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(message.guardName),
                        trailing: IconButton(
                          icon: Icon(viewModel.isExpandedList[index]
                              ? Icons.expand_less
                              : Icons.expand_more),
                          onPressed: () {
                            viewModel.toggleExpansion(index);
                          },
                        ),
                      ),
                      if (viewModel.isExpandedList[index])
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(message.alertMessage),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                message.alertDateTime,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
