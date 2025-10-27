import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<Color?> selectColor(BuildContext context) async {
  Color selected = Colors.blue;
  return showDialog<Color>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Выбери цвет'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selected,
            onColorChanged: (color) => selected = color,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(selected),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
