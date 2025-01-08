import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/Screens/deshboard.dart';
import 'package:securitymanagementsystem/providers/app_bar_notifier.dart';
import 'package:securitymanagementsystem/providers/card_notifier.dart';
import 'package:securitymanagementsystem/view/post_notification_view.dart';
import 'package:securitymanagementsystem/widgets/cards.dart';

import '../../view/inbox_view.dart';
import '../../widgets/app_bar.dart';

class SystemMessages extends StatelessWidget {
  const SystemMessages({super.key});

  @override
  Widget build(BuildContext context) {
    // calling and setting the notifier
    final appBarNotifier = Provider.of<AppBarNotifier>(context, listen: false);

    appBarNotifier.setTitle('System Messages');
    appBarNotifier.setActions([
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Dashboard()));
          },
          icon: const Icon(Icons.home))
    ]);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 190,
              width: 190,
              child: ChangeNotifierProvider(
                create: (_) => CardNotifier()
                  ..setTitle('Inbox')
                  ..setIcon(Icons.inbox)
                  ..setAction(
                    () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InboxView()));
                    },
                  ),
                child: const CustomCard(),
              ),
            ),
            // ReusableCard(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => InboxScreen()));
            //   },
            //   icon: const Icon(
            //     Icons.inbox,
            //     size: 60,
            //   ),
            //   text: 'Inbox',
            // ),

            SizedBox(
              height: 190,
              width: 190,
              child: ChangeNotifierProvider(
                create: (_) => CardNotifier()
                  ..setTitle('Send Message')
                  ..setIcon(Icons.send)
                  ..setAction(
                    () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostNotificationView()));
                    },
                  ),
                child: const CustomCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
