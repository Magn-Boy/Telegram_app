import 'package:flutter/material.dart';

class BackButtonScreen extends StatelessWidget {
  const BackButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Back Button Screen'),
      ),
      body: const Center(child: Text('Экран BackButton')),
    );
  }
}
