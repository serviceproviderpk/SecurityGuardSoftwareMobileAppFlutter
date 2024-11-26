import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/headings.dart';
import 'deshboard.dart';

class yourNotifications extends StatelessWidget {
  const yourNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(title: 'Notifications', actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                icon: const Icon(Icons.home))
          ])),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                label: headings().h3('Title'),
              ),
              DataColumn(
                label: headings().h3('Description'),
              ),
              DataColumn(
                label: headings().h3('Time'),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('John Doe')),
                  DataCell(SingleChildScrollView(
                    child: Text(
                        'You are scheduled to work from 11/12/2024 to 12/12/2024.'),
                  )),
                  DataCell(Text('2 Hours')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Max')),
                  DataCell(SingleChildScrollView(
                    child: Text(
                        'You are scheduled to work from 11/12/2024 to 12/12/2024.'),
                  )),
                  DataCell(Text('3 Hours')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Parker')),
                  DataCell(SingleChildScrollView(
                    child: Text(
                        'You are scheduled to work from 11/12/2024 to 12/12/2024.'),
                  )),
                  DataCell(Text('3 Hours')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Adam')),
                  DataCell(SingleChildScrollView(
                    child: Text(
                        'You are scheduled to work from 11/12/2024 to 12/12/2024.'),
                  )),
                  DataCell(Text('3 Hours')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
