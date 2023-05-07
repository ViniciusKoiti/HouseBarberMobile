import 'package:flutter/material.dart';
import 'package:housebarber/Components/logoAnimation.dart';
import 'package:housebarber/Pages/Login/LoginBarbeiro.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LogoAnimation(
          key: const ValueKey('SplashScreen'),
          onAnimationComplete: () {
            _navigateToNextScreen(context);
          },
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            LoginBarbeiro(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
