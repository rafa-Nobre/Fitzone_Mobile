import 'package:flutter/material.dart';

class GraphLevel extends StatelessWidget {
  const GraphLevel({
    required this.color,
    required this.width,
    super.key,
  });

  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 15,
        width: width,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
