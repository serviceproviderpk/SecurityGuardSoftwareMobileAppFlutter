import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/view/attendance_view.dart';

import '../providers/card_notifier.dart';
import '../view/notifications_view.dart';
import '../widgets/cards.dart';
import 'my_leave_balance.dart';
import 'my_leaves.dart';
import 'my_petrol.dart';
import 'my_schedule.dart';
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
                        ..setIcon(Icons.message)
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
                              builder: (context) => const myPetrol(),
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
                              builder: (context) => const mySchedule(),
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
                              builder: (context) => const myLeaves(),
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
                        ..setTitle("My Leave Balance")
                        ..setIcon(Icons.account_balance_wallet)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const myLeaveBalance(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("Visit Website")
                        ..setIcon(Icons.search)
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
