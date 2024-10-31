import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
         var _color = Theme.of(context).colorScheme;
    return GestureDetector(
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:_color.surface,
            border: Border.all(
              color:_color.surfaceContainerLow,
            ),
          ),
          child: Icon(
            Icons.notifications_none_outlined,
            color:_color.onSurface,
            size: 20,
          )),
    );
  }
}
