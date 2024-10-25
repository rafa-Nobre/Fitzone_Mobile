import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
            ),
          ),
          child: Icon(
            Icons.notifications_none_outlined,
            color: Theme.of(context).colorScheme.onSurface,
            size: 20,
          )),
    );
  }
}
