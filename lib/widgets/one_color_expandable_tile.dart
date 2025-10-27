import 'package:flutter/material.dart';

class OneColorExpandableTile extends StatelessWidget {
  final String title;
  final Color? color;

  const OneColorExpandableTile(this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [Container(height: 40, width: double.infinity, color: color)],
    );
  }
}
