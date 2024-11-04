import 'package:demo/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "SplashScreen";

  get splash => null;

  @override

  /// Returns the splash screen with a loading animation in the center.
  ///
  /// The animation is a lottie animation defined in the assets folder.
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/animations/splash.json',
              width: 400,
              height: 400,
            ),
          ),
        ],
      ),
      nextScreen: const LoginScreen(),
      splashIconSize: 400,
    );
  }
}
