import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/view_models/my_petrol_viewmodel.dart';

class MyPetrolView extends StatelessWidget {
  const MyPetrolView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Petrol API Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Press the button to find your petrol!',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                const int guardId = 85;
                const int orgId = 146;
                const int branchId = 154;

                await context
                    .read<MyPetrolViewModel>()
                    .myPetrol(guardId, orgId, branchId);
                final message = context.read<MyPetrolViewModel>().message;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 10, // Shadow effect
              ),
              icon: const Icon(Icons.send, size: 24, color: Colors.white),
              label: const Text(
                'Send Request',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ), // Text
            ),
            const SizedBox(height: 20),
            Consumer<MyPetrolViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const CircularProgressIndicator();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
