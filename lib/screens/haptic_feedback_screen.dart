import 'package:flutter/material.dart';

class HapticFeedbackScreen extends StatelessWidget {
  const HapticFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Haptic Feedback Screen')),
      body: const Center(child: Text('Экран HapticFeedback')),
    );
  }
}
