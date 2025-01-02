import 'package:calculator_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      readOnly: true,
      showCursor: true,
      cursorColor: Colors.red,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      textAlign: TextAlign.right,
      style: Styles.font40Regular(context),
      controller: controller,
    );
  }
}
