import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 15), // Button padding

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Button border radius
          ),
        ));
  }
}
