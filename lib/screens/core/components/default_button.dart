import 'package:demo/screens/core/constant/sizes.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color textcolor;
  final Color buttoncolor;

  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.textcolor,
    required this.buttoncolor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttoncolor, // Set the background color
        minimumSize:
            const Size(double.infinity, 60), // Set the width and height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textcolor,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
