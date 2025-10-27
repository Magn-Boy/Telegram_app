import 'package:flutter/material.dart';

class InfoExpandableTileWithWidget extends StatelessWidget {
  final String title;
  final Widget expanded;
  final bool initiallyExpanded;

  const InfoExpandableTileWithWidget(
    this.title,
    this.expanded, {
    super.key,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      initiallyExpanded: initiallyExpanded,
      children: [expanded],
    );
  }
}
