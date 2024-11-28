import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  bool isLoading = true;
  List<dynamic> attendanceContent = [];
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchAttendanceData();
  }

  // Fetching attendance data
  Future<void> fetchAttendanceData() async {
    final url = Uri.parse(
        'https://sss.futureminutes.com/api/MyAttendanceHistory/Details?OrganizationId=185&BranchId=186&UsersProfileId=187');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['IsSuccess'] == true && data['Content'] != null) {
          setState(() {
            attendanceContent = data['Content'];
            isLoading = false;
          });
        } else {
          setState(() {
            errorMessage = data['Message'] ?? 'No data available.';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          errorMessage =
              'Failed to fetch data. Status Code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  // Refresh the data
  Future<void> refreshAttendanceData() async {
    setState(() {
      isLoading = true;
    });
    await fetchAttendanceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: refreshAttendanceData,
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(
                  child:
                      Text(errorMessage, style: TextStyle(color: Colors.red)))
              : RefreshIndicator(
                  onRefresh: refreshAttendanceData, // Trigger on pull
                  child: ListView.builder(
                    itemCount: attendanceContent.length,
                    itemBuilder: (context, index) {
                      final attendance = attendanceContent[index];
                      final details = attendance['AttendanceDetails'] as List;

                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: ExpansionTile(
                          title: Text(
                            'Date: ${attendance['AttendanceDate'].toString().split("T")[0]}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Remarks: ${attendance['Remarks']}'),
                          children: details.map((detail) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Check-In Time: ${detail['CheckInTime']}'),
                                  Text(
                                      'Check-Out Time: ${detail['CheckOutTime']}'),
                                  Text('Location IP: ${detail['LocationIP']}'),
                                  Text(
                                      'Hours Worked: ${detail['HoursWorked']} hrs'),
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
