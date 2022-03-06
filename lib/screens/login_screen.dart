import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routename = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Portal ',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: const Center(
        child: Text('Login Portal'),
      ),
    );
  }
}
