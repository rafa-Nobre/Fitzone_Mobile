import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/account_footer.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/level_widget.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/menu_widget.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/profile_info.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/registration_status.dart';
import 'package:flutter/material.dart';
import '../../core/models/user_model.dart';

class AccountDrawer extends StatelessWidget {
  const AccountDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel profileUser = UserModel(
      id: 1,
      registrationId: 'reg123',
      name: 'fulano',
      nickName: 'fulanoNick',
      email: 'fulano@example.com',
      password: '123',
      cpf: '12345678900',
      registrationDate: DateTime.now(),
      points: 20,
      activities: [],
    );

    return Drawer(
      width: 340,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
          color: Theme.of(context).colorScheme.tertiary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ProfileInfo(profileUser: profileUser),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const RegistrationStatus(),
                  const SizedBox(
                    height: largeSpacing,
                  ),
                  LevelWidget(
                    points: profileUser.points,
                  ),
                  const SizedBox(
                    height: largeSpacing,
                  ),
                  const MenuWidget(),
                ],
              ),
              const AccountFooter()
            ],
          ),
        ),
      ),
    );
  }
}
