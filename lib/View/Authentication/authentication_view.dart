import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_now/ViewModel/Controllers/authentication_controller.dart';

enum AuthenticationCaller {
  login,
  getStarted,
}

class AuthenticationView extends StatelessWidget {
  final AuthenticationCaller caller;
  final AuthenticationController _controller = Get.put(AuthenticationController());

  AuthenticationView({super.key, required this.caller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: caller == AuthenticationCaller.login
              ? _buildLoginView(context)
              : _buildGetStartedView(context),
        ),
      ),
    );
  }

  Widget _buildLoginView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Welcome Back! Please Log In.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          'Enter your credentials to access your account.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        _buildEmailField(),
        const SizedBox(height: 20),
        _buildPasswordField(),
        const SizedBox(height: 30),
        _buildLoginButton(context),
      ],
    );
  }

  Widget _buildGetStartedView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Welcome to Our App!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          'Create an account to get started with our services.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        _buildEmailField(),
        const SizedBox(height: 20),
        _buildPasswordField(),
        const SizedBox(height: 30),
        _buildSignupButton(context),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: _controller.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _controller.passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _controller.login();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: const Text(
        'Log In',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _controller.signup();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: const Text(
        'Sign Up',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
