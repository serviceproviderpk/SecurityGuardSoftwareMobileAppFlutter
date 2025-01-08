import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/view_models/my_leaves_viewmodel.dart';

class MyLeavesView extends StatelessWidget {
  const MyLeavesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MyLeavesViewmodel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchSchedules();
    });

    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Leaves'),
      ),
      body: Consumer<MyLeavesViewmodel>(
        builder: (_, viewModel, child) {
          if (viewModel.isLoading) {
            return SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          if (viewModel.errorMessage != null) {
            return SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Center(child: Text(viewModel.errorMessage!)),
            );
          }

          if (viewModel.schedules.isEmpty) {
            return SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: const Center(child: Text('No leave data available.')),
            );
          }

          return ListView.builder(
            itemCount: viewModel.schedules.length,
            itemBuilder: (ctx, index) {
              final leave = viewModel.schedules[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.01,
                ),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          leave.guardName,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(
                          color: Colors.blueGrey,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text.rich(
                          TextSpan(
                            text: 'From: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: leave.formattedFromDate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'To: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: leave.formattedToDate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Reason: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: leave.reason,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Leave Type: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: leave.leaveType,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Shift Type: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: leave.shiftType,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
