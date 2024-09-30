import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthenticationCaller {
  login,
  getStarted,
}

class AuthenticationView extends StatelessWidget {
  final AuthenticationCaller caller;

  const AuthenticationView({super.key, required this.caller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Center(
        child: caller == AuthenticationCaller.login
            ? _buildLoginView()
            : _buildGetStartedView(),
      ),
    );
  }

  // Login-specific design
  Widget _buildLoginView() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome Back! Please Log In.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text('Enter your credentials to access your account.'),
      ],
    );
  }

  // Signup-specific design
  Widget _buildGetStartedView() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome to Our App!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text('Create an account to get started with our services.'),
      ],
    );
  }
}

