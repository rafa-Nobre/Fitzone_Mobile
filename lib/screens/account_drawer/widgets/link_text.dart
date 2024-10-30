import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    required this.title,
    required this.fontSize,
    required this.color,
    super.key,
  });

  final String title;
  final double fontSize;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(fontSize: fontSize, color: color),
      ),
    );
  }
}
