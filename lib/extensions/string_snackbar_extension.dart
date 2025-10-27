import 'package:flutter/material.dart';

extension StringSnackbar on String {
  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(this)));
  }
}
