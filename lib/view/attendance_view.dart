import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/attendance_viewmodel.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AttendanceViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<AttendanceViewModel>().fetchAttendanceData();
            },
          ),
        ],
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.errorMessage.isNotEmpty
              ? Center(
                  child: Text(
                    viewModel.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: viewModel.fetchAttendanceData,
                  child: ListView.builder(
                    itemCount: viewModel.attendanceList.length,
                    itemBuilder: (ctx, index) {
                      final attendance = viewModel.attendanceList[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: ExpansionTile(
                          title: Text(
                            'Date: ${attendance.attendanceDate.split("T")[0]}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Remarks: ${attendance.remarks}'),
                          children: attendance.details.map((detail) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Check-In Time: ${detail.checkInTime}'),
                                  Text(
                                      'Check-Out Time: ${detail.checkOutTime}'),
                                  Text('Location IP: ${detail.locationIP}'),
                                  Text(
                                      'Hours Worked: ${detail.hoursWorked} hrs'),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
