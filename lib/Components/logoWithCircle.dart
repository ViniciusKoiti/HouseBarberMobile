import 'package:flutter/material.dart';

class LogoWithCircle extends StatelessWidget {
  const LogoWithCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Calcula o tamanho máximo do logo, como 80% da largura disponível
        double logoSize = constraints.maxWidth * 0.8;

        return Stack(
          children: [
            // Imagem estática
            Image.asset('LogoHouse.png', width: logoSize),

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
                      width: logoSize / 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
