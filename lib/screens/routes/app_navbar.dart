import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo/screens/core/constant/colors.dart';
import 'package:demo/screens/pages/contact_screen.dart';
import 'package:demo/screens/pages/home_screen.dart';
import 'package:demo/screens/pages/message_screen.dart';
import 'package:demo/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatefulWidget {
  static const String routeName = 'AppNavBar';
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  final items = [
    const Icon(Icons.home, size: 30),
    const Icon(Icons.message, size: 30),
    const Icon(Icons.people, size: 30),
    const Icon(Icons.person, size: 30),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      appBar: AppBar(),
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        items: items,
        color: secondaryColor,
        buttonBackgroundColor: highlightColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body: Container(
        color: Colors.white,
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const HomeScreen();
        break;
      case 1:
        widget = const MessageScreen();
        break;
      case 2:
        widget = const ContactScreen();
        break;
      case 3:
        widget = const ProfileScreen();
        break;
      default:
        widget = const HomeScreen();
    }
    return widget;
  }
}
