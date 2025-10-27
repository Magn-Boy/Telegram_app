import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Text(
          'Негры пидорасы',
          style: TextStyle(
            color: Colors.black,
            fontSize: 52,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
