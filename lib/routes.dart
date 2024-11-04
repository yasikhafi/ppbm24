import 'package:demo/screens/widget/calculator_screen.dart';
import 'package:demo/screens/widget/convert_screen.dart';
import 'package:demo/screens/home/home_screen.dart';
import 'package:demo/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/splash/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  // RegisterScreen.routeName: (context) => const RegisterScreen(),
  // ProfileScreen.routeName: (context) => const ProfileScreen(),
  CalculatorScreen.routeName: (context) => const CalculatorScreen(),
  ConvertScreen.routeName: (context) => const ConvertScreen(),
};
