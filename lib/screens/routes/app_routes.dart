import 'package:demo/screens/login/login_screen.dart';
import 'package:demo/screens/pages/contact_screen.dart';
import 'package:demo/screens/pages/message_screen.dart';
import 'package:demo/screens/routes/app_navbar.dart';
import 'package:demo/screens/splash/splash_screen.dart';
import 'package:demo/screens/widget/calculator_screen.dart';
import 'package:demo/screens/widget/moneycv_screen.dart.dart';
import 'package:demo/screens/widget/tempcv_screen.dart';
import 'package:demo/screens/widget/vbl_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  AppNavBar.routeName: (context) => const AppNavBar(),
  // HomeScreen.routeName: (context) => const HomeScreen(),
  // RegisterScreen.routeName: (context) => const RegisterScreen(),
  // ProfileScreen.routeName: (context) => const ProfileScreen(),
  CalculatorScreen.routeName: (context) => const CalculatorScreen(),
  MoneyConverterScreen.routeName: (context) => const MoneyConverterScreen(),
  TemperatureConverterScreen.routeName: (context) =>
      const TemperatureConverterScreen(),
  VideoBased.routeName: (context) => const VideoBased(),
  MessageScreen.routeName: (context) => const MessageScreen(),
  ContactScreen.routeName: (context) => const ContactScreen(),
};
