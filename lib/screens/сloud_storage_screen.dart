import 'package:flutter/material.dart';

class CloudStorageScreen extends StatelessWidget {
  const CloudStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cloud Storage Screen')),
      body: const Center(child: Text('Экран CloudStorage')),
    );
  }
}
