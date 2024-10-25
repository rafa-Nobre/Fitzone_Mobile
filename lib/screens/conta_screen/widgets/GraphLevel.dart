import 'package:flutter/material.dart';

class GraphLevel extends StatelessWidget {
  const GraphLevel({
    required this.color,
    required this.width,
    required this.index,
    super.key,
  });

  final Color color;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      
      ),child: Text(index.toString()),
    );
  }
}
