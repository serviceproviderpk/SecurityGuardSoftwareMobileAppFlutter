import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:securitymanagementsystem/Screens/deshboard.dart';

import '../view_models/login_viewmodel.dart';
import 'password_reset_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email TextField
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email_sharp),
                  labelText: 'Email',
                  hintText: 'Your Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Password TextField
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: 'Password',
                  hintText: 'Your password'),
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // Forget Password Button
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PasswordResetView()),
                  );
                },
                child: const Text(
                  'Forget Password',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Login Button
            viewModel.isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: 200,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.login),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                      onPressed: () async {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        final loginResponse =
                            await viewModel.login(email, password);

                        if (loginResponse != null && loginResponse.isSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                          );
                        } else {
                          showErrorDialog(viewModel.message);
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
