import 'package:flutter/material.dart';

class TextFieldWithText extends StatelessWidget {
  const TextFieldWithText(
      {super.key,
      required this.title,
      required this.controller,
      required this.icon});

  final String title;
  final TextEditingController controller;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 10),
        TextField(
          textAlign: TextAlign.left,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: icon,
            labelText: title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
