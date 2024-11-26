import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'CheckInOutScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login(String email, String password) async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
        'https://sss.futureminutes.com/api/Login/ValidateUser'); // Replace with your API URL
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'Email': email, 'Password': password}),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['IsSuccess'] == true) {
        // Navigate to the next screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Checkinoutscreen()),
        );
      } else {
        // Show error message
        showErrorDialog(data['Message']);
      }
    } else {
      showErrorDialog('Something went wrong. Please try again.');
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration:
                  InputDecoration(
                      icon: Icon(Icons.email_sharp),
                      labelText: 'Email', hintText: 'Your Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                  labelText: 'Password', hintText: 'Your password'),
              obscureText: true,
            ),
            SizedBox(height: 32),
            isLoading
                ? CircularProgressIndicator()
                : SizedBox(
                    width: 200,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.login),
                      // Button Design
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          // Rounded corners
                        ),
                        elevation: 10,
                        // Shadow elevation
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15), // Padding
                      ),
                      // Button navigation and conditions
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        if (email.isNotEmpty && password.isNotEmpty) {
                          login(email, password);
                        } else {
                          showErrorDialog('Please fill in all fields.');
                        }
                      },
                      label: const Text('Login'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
