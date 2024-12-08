import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/core/service/auth_service.dart';
import 'package:fitzone_app/routes/routes_consts.dart';
import 'package:flutter/material.dart';
import 'button_menu.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FITZONE",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color.onSurface),
        ),
        const SizedBox(
          height: minorSpacing,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color.surfaceContainer,
            border: Border.all(
                color: color.surfaceContainerLow),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            children: [
              ButtonMenu(
                title: "Evolução",
                icon: Icons.emoji_emotions_outlined,
                onTap: () {},
              ),
              ButtonMenu(
                title: "Pagamento",
                icon: Icons.payment,
                onTap: () {},
              ),
              ButtonMenu(
                title: "Treinos",
                icon: Icons.sports_gymnastics_outlined,
                onTap: () {},
              ),
              ButtonMenu(
                title: "Professor",
                icon: Icons.person_2_outlined,
                onTap: () {},
              ),
              ButtonMenu(
                title: "Configurações",
                icon: Icons.settings_outlined,
                onTap: () {},
              ),
              ButtonMenu(
                title: "Sair",
                icon: Icons.logout,
                onTap: () async {
                  await AuthService().signOut().whenComplete(() {
                    Navigator.of(context).pushReplacementNamed(RoutesConsts.login);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
