import 'package:calculator_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color});
  final String text;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 2,
        overlayColor: Colors.amber,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 2),
      ),
      child: Text(
        text,
        style: Styles.font22SemiBold(context).copyWith(
          color: color,
        ),
      ),
    );
  }
}
