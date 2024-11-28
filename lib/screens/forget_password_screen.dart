import 'package:flutter/material.dart';

import '../providers/api_service.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController _emailController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String _message = '';

  Future<void> _resetPassword() async {
    setState(() {
      _isLoading = true;
      _message = '';
    });

    final emailOrUsername = _emailController.text.trim();

    if (emailOrUsername.isEmpty) {
      setState(() {
        _isLoading = false;
        _message = 'Please enter your email address.';
      });
      return;
    }

    try {
      final response = await _apiService.passwordReset(
        email: emailOrUsername,
      );

      setState(() {
        _isLoading = false;

        if (response.containsKey('Message')) {
          _message = response['Message'];
        } else {
          _message = 'Unexpected response format. Please try again.';
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _message = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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

              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: const TextStyle(color: Colors.blueAccent),
                      hintText: "Enter your registered email",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      icon: Icon(Icons.attach_email),
                    ),
                  ),
                ),
              ),

              // TextField Design

              const SizedBox(height: 30),

              // Elevated Button
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: ElevatedButton.icon(
                        onPressed: _resetPassword,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          // Increased padding
                          elevation: 10, // Shadow effect
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

              // Message display after API call
              if (_message.isNotEmpty)
                Text(
                  _message,
                  style: TextStyle(
                    color: _message.contains('Error') ||
                            _message.contains('not registered')
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
