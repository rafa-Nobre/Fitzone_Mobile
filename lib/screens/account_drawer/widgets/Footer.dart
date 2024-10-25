import 'package:fitzone_app/screens/account_drawer/widgets/Link.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Link(
          title: "Política de Privacidade",
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: 12,
        ),
        const SizedBox(width: 10),
        Link(
            title: "Termos de Serviço",
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 12),
      ],
    );
  }
}
