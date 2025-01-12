import 'package:demo/routes/app_navbar.dart';
import 'package:demo/services/auth/loginOrRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              return const AppNavBar();
            }
            // user is not logged in
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
