import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/providers/app_bar_notifier.dart';
import 'package:securitymanagementsystem/view/login_view.dart';
import 'package:securitymanagementsystem/view_models/attendance_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/inbox_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/leave_request_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/login_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/my_leaves_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/my_petrol_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/my_schedule_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/password_reset_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/post_notification_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordResetViewModel()),
        ChangeNotifierProvider(create: (_) => AppBarNotifier()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(
            create: (_) => AttendanceViewModel()..fetchAttendanceData()),
        ChangeNotifierProvider(
            create: (_) => InboxViewModel()..fetchMessages()),
        ChangeNotifierProvider(create: (_) => MyScheduleViewModel()),
        ChangeNotifierProvider(create: (_) => MyLeavesViewmodel()),
        ChangeNotifierProvider(create: (_) => PostNotificationViewModel()),
        ChangeNotifierProvider(create: (context) => LeaveRequestViewModel()),
        ChangeNotifierProvider(create: (_) => MyPetrolViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginView(),
    );
  }
}
