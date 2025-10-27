import 'package:flutter/material.dart';

class InfoExpandableTile extends StatelessWidget {
  final String title;
  final String value;

  const InfoExpandableTile(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [
        Padding(padding: const EdgeInsets.all(8.0), child: Text(value)),
      ],
    );
  }
}
