import 'package:flutter/material.dart';

customSnackBar(String message, BuildContext context, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
