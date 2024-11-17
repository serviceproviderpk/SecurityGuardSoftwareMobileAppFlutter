import 'package:flutter/material.dart';


import '../../reusable_files/cards.dart';
import 'screens/apply_leave/my_leaves.dart';
import 'screens/attendace_history/my_attendance.dart';
import 'screens/leave_balance/my_leave_balance.dart';
import 'screens/my_petrols/my_petrol.dart';
import 'screens/my_schedule/my_schedule.dart';
import 'screens/notifications/your_notifications.dart';
import 'screens/system_messages/system_msgs.dart';
import 'screens/visite_website/visite_website.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ReusableCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const yourNotifications()));
                  },
                  icon: const Icon(
                    Icons.notifications,
                    size: 60,
                  ),
                  text: 'Your Notifications',
                ),
                ReusableCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SystemMessages()));
                  },
                  icon: const Icon(
                    Icons.message,
                    size: 60,
                  ),
                  text: 'System Messages',
                ),
              ],
            ),
            Row(
              children: [
                ReusableCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const myPetrol()));
                  },
                  icon: const Icon(
                    Icons.directions_car_filled,
                    size: 60,
                  ),
                  text: 'My Petrol',
                ),
                ReusableCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendanceScreen()));
                  },
                  icon: const Icon(
                    Icons.list_alt,
                    size: 60,
                  ),
                  text: 'My Attendance',
                ),
              ],
            ),
            Row(
              children: [
                ReusableCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mySchedule()));
                  },
                  icon: const Icon(
                    Icons.schedule,
                    size: 60,
                  ),
                  text: 'My Schedule',
                ),
                ReusableCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const myLeaves()));
                  },
                  icon: const Icon(
                    Icons.unpublished_rounded,
                    size: 60,
                  ),
                  text: 'My Leaves',
                ),
              ],
            ),
            Row(
              children: [
                ReusableCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const myLeaveBalance()));
                  },
                  icon: const Icon(
                    Icons.account_balance_wallet,
                    size: 60,
                  ),
                  text: 'My Leave Balance',
                ),
                ReusableCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const visitWebsite()));
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 60,
                  ),
                  text: 'Visit Website',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
