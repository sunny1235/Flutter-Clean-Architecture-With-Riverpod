import 'package:flutter/material.dart';
// import 'package:flutter_clean_architecture/features/authentication/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  final String name;
  const RegistrationScreen({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration for $name'),
      ),
    );
  }
}
