import 'package:flutter/material.dart';
import 'link_text.dart';

class AccountFooter extends StatelessWidget {
  const AccountFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinkText(
          title: "Política de Privacidade",
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: 12,
        ),
        const SizedBox(width: 10),
        LinkText(
            title: "Termos de Serviço",
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 12),
      ],
    );
  }
}
