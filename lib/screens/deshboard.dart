import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/view/attendance_view.dart';
import 'package:securitymanagementsystem/view/leave_request_view.dart';
import 'package:securitymanagementsystem/view/login_view.dart';
import 'package:securitymanagementsystem/view/my_leaves_view.dart';
import 'package:securitymanagementsystem/view/my_petrol_view.dart';
import 'package:securitymanagementsystem/view/my_schedule_view.dart';

import '../providers/card_notifier.dart';
import '../view/notifications_view.dart';
import '../view_models/help_me_viewmodel.dart';
import '../widgets/cards.dart';
import 'system_messages/system_msgs.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Dashboard(),
    const SystemMessages(),
    const MyScheduleView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/icons/dashboard.png',
            height: 70,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LoginView()));
            },
            icon: const Icon(
              Icons.person,
            ),
            color: Colors.black,
          )
        ],
        toolbarHeight: screenHeight * 0.04,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.01,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First Row
              Row(
                children: [
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("System Notifications")
                        ..setIcon(Icons.notifications)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NotificationScreen(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                  Expanded(
                    child: ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle("Your Messages")
                        ..setIcon(Icons.notification_important)
                        ..setAction(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SystemMessages(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.005),

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
                              builder: (_) => const MyPetrolView(),
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
                              builder: (_) => const AttendanceView(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.005),

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
                              builder: (_) => const MyScheduleView(),
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
                              builder: (_) => const MyLeavesView(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.005),

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
                              builder: (_) => const LeaveRequestView(),
                            ),
                          );
                        }),
                      child: const CustomCard(),
                    ),
                  ),
                  Expanded(
                    child: ChangeNotifierProvider<CardNotifier>(
                      create: (context) => CardNotifier()
                        ..setTitle("Help Me")
                        ..setIcon(Icons.help)
                        ..setAction(() async {
                          final helpMeViewModel = HelpMeViewmodel();
                          await helpMeViewModel.helpRequest();
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Help Request"),
                                content: Text(helpMeViewModel.message),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                      child: const CustomCard(),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'My Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            label: 'System Notification',
          ),
        ],
      ),
    );
  }
}
