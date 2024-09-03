import 'package:flutter/material.dart';
import 'package:meetx/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onPressed, required this.text, super.key});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50)),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
