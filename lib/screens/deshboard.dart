import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/view/attendance_view.dart';
import 'package:securitymanagementsystem/view/leave_request_view.dart';
import 'package:securitymanagementsystem/view/my_leaves_view.dart';
import 'package:securitymanagementsystem/view/my_petrol_view.dart';
import 'package:securitymanagementsystem/view/my_schedule_view.dart';

import '../providers/card_notifier.dart';
import '../view/notifications_view.dart';
import '../widgets/cards.dart';
import 'system_messages/system_msgs.dart';
import 'visite_website.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),

              // First Row
              Row(
                children: [
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("Your Notifications")
                        ..setIcon(Icons.notifications)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("System Messages")
                        ..setIcon(Icons.notification_important)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SystemMessages(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Second Row
              Row(
                children: [
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("My Petrol")
                        ..setIcon(Icons.directions_car_filled)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyPetrolView(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("My Attendance")
                        ..setIcon(Icons.list_alt)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AttendanceView(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Third Row
              Row(
                children: [
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("My Schedule")
                        ..setIcon(Icons.schedule)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyScheduleView(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("My Leaves")
                        ..setIcon(Icons.unpublished_rounded)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyLeavesView(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Fourth Row
              Row(
                children: [
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("Apply Leave")
                        ..setIcon(Icons.account_balance_wallet)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LeaveRequestView(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("Help Me")
                        ..setIcon(Icons.help)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const visitWebsite(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
