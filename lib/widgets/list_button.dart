import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const ListButton(this.title, {super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(onPressed: onPress, child: Text(title)),
    );
  }
}
