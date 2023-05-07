import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final Color color;

  const TitleText({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Great Vibes',
        fontSize: 32,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = LinearGradient(
            colors: [color, Colors.black87],
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
        shadows: const [
          Shadow(
            blurRadius: 3.0,
            color: Colors.grey,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
    );
  }
}
