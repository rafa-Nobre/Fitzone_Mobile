import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.red),
    );
  }
}
