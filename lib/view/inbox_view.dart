import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class InboxView extends StatefulWidget {
  @override
  _InboxViewState createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  List<dynamic> messages = [];
  String statusMessage = 'Loading...';
  List<bool> isExpandedList = []; // To track dropdown state for each card

  Future<void> fetchMessages() async {
    final Dio dio = Dio();
    try {
      final response = await dio.get(
          'https://sss.futureminutes.com/api/SystemMessages/MyMessages?GuardId=98');

      if (response.data['IsSuccess'] == true) {
        setState(() {
          messages = response.data['Content'] ?? [];
          isExpandedList = List<bool>.filled(
              messages.length, false); // Initialize dropdown states
        });
      } else {
        setState(() {
          statusMessage = 'No data found or unsuccessful request.';
        });
      }
    } catch (e) {
      setState(() {
        statusMessage = 'Error fetching messages: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Guard Alerts'),
        backgroundColor: Colors.blue,
      ),
      body: messages.isEmpty && statusMessage == 'Loading...'
          ? Center(child: CircularProgressIndicator())
          : messages.isEmpty
              ? Center(child: Text(statusMessage))
              : ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];
                    return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title:
                                  Text(message['GuardName'] ?? 'Unknown Guard'),
                              trailing: IconButton(
                                icon: Icon(isExpandedList[index]
                                    ? Icons.expand_less
                                    : Icons.expand_more),
                                onPressed: () {
                                  setState(() {
                                    isExpandedList[index] =
                                        !isExpandedList[index];
                                  });
                                },
                              ),
                            ),
                            if (isExpandedList[
                                index]) // Show details if expanded
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Html(data: message['AlertMessage']),
                                  SizedBox(height: 5),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      message['AlertDateTime'] ?? '',
                                      style: TextStyle(
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
                ),
    );
  }
}
