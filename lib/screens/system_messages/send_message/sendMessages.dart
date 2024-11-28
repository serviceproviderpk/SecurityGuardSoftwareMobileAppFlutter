
import 'package:flutter/material.dart';
import 'package:securitymanagementsystem/Screens/system_messages/system_msgs.dart';
import 'package:securitymanagementsystem/providers/app_bar_notifier.dart';
import 'package:securitymanagementsystem/screens/system_messages/send_message/write_message.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/headings.dart';
import 'package:provider/provider.dart';

class SendMessagesScreen extends StatelessWidget {
  const SendMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // setting notifier
    final appBarNotifier = Provider.of<AppBarNotifier>(context, listen: false);

    // setting values
    appBarNotifier.setTitle('Send Messages');
    appBarNotifier.setActions([
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => WriteMessage()));
      }, icon: const Icon(Icons.add)),
      IconButton(onPressed: (){}, icon: const Icon(Icons.refresh)),
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SystemMessages()));
      }, icon: const Icon(Icons.home)),
    ]);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(
                  color: Colors.grey,
                  width: .8,
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: headings().h4('Name'),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Muhammad Arshad'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: headings().h4('Age'),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('42'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: headings().h4('Message'),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'The quick brown fox jumped over on the lazy dog. \n'
                              'The quick brown fox jumped over on the lazy dog.'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
