import 'package:flutter/material.dart';

class ButtonCancel extends StatelessWidget {
  const ButtonCancel({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style:
            ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.grey)),
        child: Text(title));
  }

  void onPressed() {}
}
