// custom_text_buton.dart
import 'package:flutter/material.dart';

class CustomTextButon extends StatelessWidget {
  const CustomTextButon({
    super.key,
    required this.text,
    required this.textColor, this.onPressed,
  });
  final String text;
  final Color textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
