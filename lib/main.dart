import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/providers/app_bar_notifier.dart';
import 'package:securitymanagementsystem/view/login_view.dart';
import 'package:securitymanagementsystem/view_models/attendance_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/login_viewmodel.dart';
import 'package:securitymanagementsystem/view_models/password_reset_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordResetViewModel()),
        ChangeNotifierProvider(create: (_) => AppBarNotifier()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(
            create: (_) => AttendanceViewModel()..fetchAttendanceData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
    );
  }
}
