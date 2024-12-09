import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/data/providers/user_provider.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/account_footer.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/level_widget.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/menu_widget.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/profile_info.dart';
import 'package:fitzone_app/screens/account_drawer/widgets/registration_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDrawer extends StatelessWidget {
  const AccountDrawer({super.key});

  @override
  Widget build(BuildContext context) {

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
                  const ProfileInfo(),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const RegistrationStatus(),
                  const SizedBox(
                    height: largeSpacing,
                  ),
                  LevelWidget(
                    points: Provider.of<UserProvider>(context).currentUser?.points ?? 0,
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
