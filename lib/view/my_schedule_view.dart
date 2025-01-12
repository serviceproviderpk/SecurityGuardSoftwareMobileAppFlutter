import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../view_models/my_schedule_viewmodel.dart';

class MyScheduleView extends StatefulWidget {
  const MyScheduleView({Key? key}) : super(key: key);

  @override
  _MyScheduleViewState createState() => _MyScheduleViewState();
}

class _MyScheduleViewState extends State<MyScheduleView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MyScheduleViewModel>(context, listen: false)
            .fetchSchedules());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Schedules'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<MyScheduleViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  viewModel.errorMessage!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (viewModel.schedules.isEmpty) {
            return const Center(
              child: Text(
                'No schedules available.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }

          final dateFormatter = DateFormat('dd/MM/yyyy hh:mm a');
          return ListView.builder(
            itemCount: viewModel.schedules.length,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            itemBuilder: (context, index) {
              final schedule = viewModel.schedules[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schedule.guardName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Shift: ${schedule.guardShift}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Shift Start: ${schedule.shiftStartTime != '00:00:00' ? schedule.shiftStartTime : 'Not Available'}',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                      Text(
                        'Shift End: ${schedule.shiftEndTime != '00:00:00' ? schedule.shiftEndTime : 'Not Available'}',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                      const Divider(),
                      Text(
                        'From: ${schedule.dateFrom != null ? dateFormatter.format(schedule.dateFrom!) : 'Not Available'}',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                      Text(
                        'To: ${schedule.dateTo != null ? dateFormatter.format(schedule.dateTo!) : 'Not Available'}',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                      const Divider(),
                      Text(
                        'Address: ${schedule.address}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Phone: ${schedule.phoneNumber}',
                        style: const TextStyle(fontSize: 14),
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
