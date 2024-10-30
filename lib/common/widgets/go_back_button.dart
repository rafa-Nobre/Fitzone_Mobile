import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.onSecondary,
          onPressed: () {},
        ),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
