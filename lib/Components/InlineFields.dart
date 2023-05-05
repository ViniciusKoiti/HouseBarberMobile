import 'package:flutter/material.dart';

class ResponsiveInlineFields extends StatelessWidget {
  final Widget field1;
  final Widget field2;
  final int flex1;
  final int flex2;
  final String title1;
  final String title2;

  ResponsiveInlineFields({
    required this.field1,
    required this.field2,
    this.flex1 = 1,
    this.flex2 = 1,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: flex1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              field1,
            ],
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          flex: flex2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              field2,
            ],
          ),
        ),
      ],
    );
  }
}
