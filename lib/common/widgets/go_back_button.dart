import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
     var _color = Theme.of(context).colorScheme;
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          color: _color.onSecondary,
          onPressed: () {},
        ),
        Text(
          title,
          style: TextStyle(
            color: _color.onSecondary,
          ),
        ),
      ],
    );
  }
}
