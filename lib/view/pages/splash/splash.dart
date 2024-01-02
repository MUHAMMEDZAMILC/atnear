import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../landing/landingpage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 200,
        splash: 'assets/images/logo.png', nextScreen: const LandingScreen());
  }
}
