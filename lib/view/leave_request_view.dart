import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/my_schedules_api_service.dart';
import '../view_models/leave_request_viewmodel.dart';

class LeaveRequestView extends StatefulWidget {
  const LeaveRequestView({Key? key}) : super(key: key);

  @override
  State<LeaveRequestView> createState() => _LeaveRequestViewState();
}

class _LeaveRequestViewState extends State<LeaveRequestView> {
  String? selectedValue;
  List<String> items = ['Annual Leave', 'Sick Leave', 'Funeral Leave'];

  DateTime? fromDate;
  DateTime? toDate;
  int? selectedLeaveType;
  TextEditingController reasonController = TextEditingController();
  TextEditingController workingDaysController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // From Date Picker
            ElevatedButton(
              onPressed: () async {
                fromDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                setState(() {});
              },
              child: Text(
                fromDate == null
                    ? 'Select From Date'
                    : 'From Date: ${fromDate!.toLocal()}'.split(' ')[0],
              ),
            ),
            // To Date Picker
            ElevatedButton(
              onPressed: () async {
                toDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                setState(() {});
              },
              child: Text(
                toDate == null
                    ? 'Select To Date'
                    : 'Selected: ${toDate!.toLocal()}'.split(' ')[0],
              ),
            ),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(labelText: 'Reason for Leave'),
            ),
            TextField(
              controller: workingDaysController,
              decoration: const InputDecoration(labelText: 'Working Days'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: selectedValue,
              hint: const Text('Select Leave Type'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                  if (newValue == 'Annual Leave') {
                    selectedLeaveType = 1;
                  } else if (newValue == 'Sick Leave') {
                    selectedLeaveType = 2;
                  } else if (newValue == 'Funeral Leave') {
                    selectedLeaveType = 3;
                  }
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () async {
                  if (fromDate != null &&
                      toDate != null &&
                      reasonController.text.isNotEmpty &&
                      selectedLeaveType != null) {
                    await MySchedulesApiService().fetchMySchedule();

                    int workingDays =
                        int.tryParse(workingDaysController.text) ?? 0;

                    await context
                        .read<LeaveRequestViewModel>()
                        .submitLeaveRequest(
                          reasonController.text,
                          fromDate!,
                          toDate!,
                          selectedLeaveType!,
                          workingDays,
                        );

                    final responseMessage =
                        context.read<LeaveRequestViewModel>().message;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(responseMessage)),
                    );
                    setState(() {
                      reasonController.clear();
                      workingDaysController.clear();
                      selectedValue = null;
                      selectedLeaveType = null;
                      fromDate = null;
                      toDate = null;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please fill in all fields.')),
                    );
                  }
                },
                child: const Text('Apply Leave'),
              )
          ],
        ),
      ),
    );
  }
}
