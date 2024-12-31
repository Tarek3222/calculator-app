import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.onPressed,
      this.size,
      required this.tooltip});
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final double? size;
  final String tooltip;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
