import 'package:demo/screens/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:demo/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wizard Math',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply().copyWith(
                bodyLarge: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                bodyMedium: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: textColorWhite,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            color: textColorWhite,
            fontSize: 16,
            fontWeight: FontWeight.w100,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: textColorWhite,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: textColorWhite,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: textColorWhite,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: textColorWhite,
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: errorColor,
              width: 1.2,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: errorColor,
              width: 1.2,
            ),
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
