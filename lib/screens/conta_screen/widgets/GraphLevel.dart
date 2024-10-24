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
    return Container(
      height: 15,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
