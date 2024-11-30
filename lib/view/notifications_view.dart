import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/Screens/deshboard.dart';
import 'package:securitymanagementsystem/providers/app_bar_notifier.dart';
import 'package:securitymanagementsystem/services/api_service.dart';
import 'package:securitymanagementsystem/widgets/app_bar.dart';

import '../view_models/notifications_viewmodel.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appBarNotifier = Provider.of<AppBarNotifier>(context, listen: false);

    _appBarNotifier.setTitle('Notifications');
    _appBarNotifier.setActions([
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Dashboard()),
          );
        },
        icon: const Icon(Icons.dashboard),
      ),
    ]);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: ChangeNotifierProvider(
        create: (_) => NotificationViewModel(apiService: ApiService())
          ..fetchNotifications(98),
        child: Consumer<NotificationViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: viewModel.notifications.length,
                itemBuilder: (context, index) {
                  var notification = viewModel.notifications[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(notification.userName),
                      subtitle: Text(notification.message),
                      leading: const Icon(
                        Icons.notifications,
                        color: Colors.blue,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
