import 'package:flutter/material.dart';

class SettingsButtonScreen extends StatelessWidget {
  const SettingsButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Button Screen')),
      body: const Center(child: Text('Экран SettingsButton')),
    );
  }
}
