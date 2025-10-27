import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

class ThemeParamsWidget extends StatelessWidget {
  final ThemeParams params;

  const ThemeParamsWidget(this.params, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('bgColor: ${params.bgColor}'),
        Text('textColor: ${params.textColor}'),
        Text('hintColor: ${params.hintColor}'),
      ],
    );
  }
}
