import 'package:demo/screens/core/constant/sizes.dart';
import 'package:demo/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'ProfileScreen';
  const ProfileScreen({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // profile screen
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          sizedBox,
          OutlinedButton(onPressed: logout, child: Text('Sign Out')),
        ],
      ),
    );
  }
}
