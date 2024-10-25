import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {


  const ButtonMenu({
    required this.title,
    required this.icon, 
  
    super.key,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon,
                    color: Theme.of(context).colorScheme.onSurface, size: 20),
                const SizedBox(width: 10),
                Text(title.toUpperCase(), style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onSurface,
              size: 12,
            ),
          ],
        ));
  }
}
