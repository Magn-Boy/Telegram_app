import 'package:flutter/material.dart';

class MainButtonScreen extends StatelessWidget {
  const MainButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Button Screen')),
      body: const Center(child: Text('Экран MainButton')),
    );
  }
}
