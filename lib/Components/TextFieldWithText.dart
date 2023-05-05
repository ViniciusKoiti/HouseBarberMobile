import 'package:flutter/material.dart';

class TextFieldWithText extends StatelessWidget {
  const TextFieldWithText({required this.title, required this.controller});

  final String title;
  final TextEditingController controller;

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
            labelText: title,
            border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
