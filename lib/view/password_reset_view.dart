import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/password_reset_viewmodel.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PasswordResetViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Reset"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter your email address to reset your password.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Email TextField
              TextField(
                onChanged: (value) => viewModel.email = value,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your registered email",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  icon: const Icon(Icons.attach_email),
                ),
              ),

              const SizedBox(height: 30),

              // Submit Button
              viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: ElevatedButton.icon(
                        onPressed: () => viewModel.resetPassword(),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                        label: const Text(
                          "Reset Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        icon: const Icon(
                          Icons.restart_alt,
                          color: Colors.amber,
                        ),
                      ),
                    ),

              const SizedBox(height: 20),

              // Message Display
              if (viewModel.message.isNotEmpty)
                Text(
                  viewModel.message,
                  style: TextStyle(
                    color: viewModel.message.contains("Error") ||
                            viewModel.message.contains("not registered")
                        ? Colors.red
                        : Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
