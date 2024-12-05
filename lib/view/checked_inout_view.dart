import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/Screens/deshboard.dart';
import 'package:securitymanagementsystem/widgets/cards.dart';
import 'package:securitymanagementsystem/widgets/headings.dart';

import '../providers/card_notifier.dart';
import '../view_models/checkin_out_viewmodel.dart';

class CheckInOutScreen extends StatelessWidget {
  const CheckInOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckInOutViewModel(),
      child: Scaffold(
        body: Consumer<CheckInOutViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.message.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(viewModel.message)),
                );
              });
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please do CheckIn/CheckOut\nbefore accessing the Dashboard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: .5,
                  indent: 30.0,
                  endIndent: 30.0,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Dashboard button
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const Dashboard()),
                      );
                    },
                    label: headings().h3('Dashboard'),
                    icon: const Icon(
                      Icons.dashboard_customize,
                      color: Colors.blue,
                      weight: 40,
                      size: 40,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: Colors.transparent,
                      overlayColor: Colors.grey,
                      elevation: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Status message display (Optional)
                if (viewModel.isLoading) ...[
                  const CircularProgressIndicator(),
                  const SizedBox(height: 10),
                  const Text('Processing...'),
                ],
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Check-In Card
                    ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle('Check-In')
                        ..setIcon(Icons.check_box)
                        ..setAction(() async {
                          await viewModel.performCheckInOut('CheckIn');
                        }),
                      child: const CustomCard(),
                    ),
                    // Check-Out Card
                    ChangeNotifierProvider(
                      create: (_) => CardNotifier()
                        ..setTitle('Check-Out')
                        ..setIcon(Icons.outbond_rounded)
                        ..setAction(() async {
                          await viewModel.performCheckInOut('CheckOut');
                        }),
                      child: const CustomCard(),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
