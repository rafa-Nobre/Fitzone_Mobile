import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/ButtonMenu.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FITZONE",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(
          height: minorSpacing,
        ),
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            border: Border.all(
                color: Theme.of(context).colorScheme.surfaceContainerLow),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: const Column(
            children: [
              ButtonMenu(
                title: "Evolução",
                icon: Icons.emoji_emotions_outlined,
              ),
              ButtonMenu(
                title: "Pagamento",
                icon: Icons.payment,
              ),
              ButtonMenu(
                  title: "Treinos", icon: Icons.sports_gymnastics_outlined),
              ButtonMenu(title: "Professor", icon: Icons.person_2_outlined),
              ButtonMenu(title: "Configurações", icon: Icons.settings_outlined),
            ],
          ),
        ),
      ],
    );
  }
}
