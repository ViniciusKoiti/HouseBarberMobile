import 'package:flutter/material.dart';

class LogoWithCircle extends StatelessWidget {
  const LogoWithCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagem estática
        Image.asset('LogoHouse.png'),

        // Círculo
        Positioned.fill(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: 0.0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black87,
                  width: 10000.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
