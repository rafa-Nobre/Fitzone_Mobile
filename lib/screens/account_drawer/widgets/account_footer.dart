import 'package:flutter/material.dart';
import 'link_text.dart';

class AccountFooter extends StatelessWidget {
  const AccountFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     var _color = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: LinkText(
            title: "Política de Privacidade",
            color:_color.onSecondary,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: LinkText(
              title: "Termos de Serviço",
              color:_color.onSecondary,
              fontSize: 12),
        ),
      ],
    );
  }
}
