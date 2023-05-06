import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  final VoidCallback onAnimationComplete;

  const LogoAnimation({required Key key, required this.onAnimationComplete})
      : super(key: key);

  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            // Círculo
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: _animation.value,
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 5.0,
                    ),
                  ),
                  child: Container(),
                ),
              ),
            ),
            // Ícone e Texto
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.sailing,
                    size: 64,
                    color: Colors.black,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'HouseBarber',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Imagem
            Positioned.fill(
              child: Opacity(
                opacity: _animation.value,
                child: child,
              ),
            ),
          ],
        );
      },
      child: Image.asset('LogoHouse.png'),
    );
  }
}
