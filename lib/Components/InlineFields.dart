import 'package:flutter/material.dart';

class ResponsiveInlineFields extends StatelessWidget {
  final Widget field1;
  final Widget field2;
  final int flex1;
  final int flex2;

  const ResponsiveInlineFields({
    super.key,
    required this.field1,
    required this.field2,
    this.flex1 = 1,
    this.flex2 = 1,
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
              const SizedBox(height: 0),
              field1,
            ],
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: flex2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              field2,
            ],
          ),
        ),
      ],
    );
  }
}
